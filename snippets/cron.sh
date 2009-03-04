#!/bin/sh

###########################################################
#
# cron.sh - запускалка cron-скриптов; сохраняет stdout и time, и, если не пустой - stderr
#
# $URL: http://svn.sk/main/person/branches/0.18.x/cron/cron.sh $
#
# $Id: cron.sh 37376 2008-12-22 11:16:04Z lev $
#
############################################################

# скрипт весьма кривой, особенно вчасти условий if().
# кто может - пусть сделает лучше...

CRONDIR='/usr/local/www/person/cron'
# no NFS - LOG_DIR='/usr/local/www/person/var/share/log/crontab'
LOG_DIR='/person/var/local/log/crontab'
LOG_DIR_DEV='/person/var/local/log/crontab'

PHP='/usr/local/bin/php -q'
PERL='/usr/bin/perl'
PATH='/bin:/usr/bin'
MAIL='/usr/bin/mail'

MAILTO='developers@person.com'
#MAILTO='lev@mail.sk'

MKDIR='/bin/mkdir'
EGREP='/usr/bin/egrep'
DATE='/bin/date'
TIME='/usr/bin/time'
TAIL='/usr/bin/tail'
HOSTNAME='/bin/hostname'
TR='/usr/bin/tr'
RM='/bin/rm'
LS='/bin/ls'
WC='/usr/bin/wc'
BASENAME='/usr/bin/basename'

DATE_FORMAT_TODAY="+%Y-%m-%d"
DATE_FORMAT_FNAME_LOG="+%Y-%m-%d_%H:%M"
DATE_FORMAT_FNAME_TIME=$DATE_FORMAT_TODAY
DATE_FORMAT_TIME="+%Y-%m-%d %H:%M"

#--------------------------------------------

script=$1
param1=$2 # пока заплатка. в последствии надо научить принимать любые параметры

if [ -z "$script" ]
then
    echo "Usage:"
    echo "`$BASENAME $0` cron_script_name    - run the given cron script"
    echo "`$BASENAME $0` check_err           - check and send email with today's .err list"
    exit 1
fi

if [ 1 -eq "`$HOSTNAME | $EGREP -c 'sk$|ss$'`" ]
then LOG_DIR="$LOG_DIR_DEV"
$MKDIR -p $LOG_DIR
fi

SCRIPT=$PERL
if [ 1 -eq `echo -n "$script" | $EGREP -c 'php$'` ]
then SCRIPT="$PHP"
fi

log_base="${LOG_DIR}/`$DATE ${DATE_FORMAT_FNAME_LOG}`_`echo -n $script | $TR / _`"
log="$log_base.log"
err="$log_base.err"
tim="${LOG_DIR}/`$DATE ${DATE_FORMAT_FNAME_TIME}`.time"

if [ "check_err" = "$script" ]
then
    today="`$DATE ${DATE_FORMAT_TODAY}`"
    sleep 40        # чтобы скрипты, начавшиеся одновременно, имели шанс уже закончиться.
    cd $LOG_DIR     # /usr/bin/cd - почему-то не катит :-?
    err="`$LS -l *${today}*err 2>/dev/null`"
    if [ -n "$err" ]
    then
        ( echo "log dir: $LOG_DIR"; echo "$err" ) | $MAIL -s "crontab errors" $MAILTO
    fi
    exit 1
fi

cmd="$TIME $SCRIPT $CRONDIR/$script $param1"

# собственно - выполнение скрипта
#echo "$cmd"
$cmd 1>$log 2>$err

# TODO: PHP-скрипты отчитываются об SQL-времени, надо научить этому .pl и учесть в статистике

# время выполнения скрипта
tim_line=`$TAIL -1 $err | tr -d A-Za-z`

# если в .err всего 1 строка, да и та от $TIME, то стереть .err
if [ 1 -eq `$WC -l <$err` ]
then
    if [ 1 -eq `$EGREP -c ' *[0-9,\.]+ +real.*user.*sys' <$err` ]
    then $RM -f $err
    fi
fi

# если $err ещё есть, то была ошибка надо отчитаться о ней
if [ -r $err ]
then
    err_size=`$WC -c <$err`
    if [ 2000 -gt $err_size ]
    then cat $err | $MAIL -s "crontab error: $err" $MAILTO
    else ( echo size = $err_size ; echo "cat $err" ) | $MAIL -s "crontab error: $err" $MAILTO
    fi
else err_size=0
fi

# теперь результат time и размеры $log/$err добавляется в .time

if [ ! -r $tim ]
then echo "# Date	Time	Real	User	System	stdout	stderr	Job" >$tim
fi

echo `$DATE "${DATE_FORMAT_TIME} "` $tim_line `$WC -c <$log` $err_size $script | $TR -s ' ' '\t' 1>>$tim 2>>$tim

