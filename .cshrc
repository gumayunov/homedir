# $FreeBSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#


# A righteous umask
umask 2

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin /adm/bin)

setenv LESS -MQR
#setenv LANG ru_RU.KOI8-R
setenv LANG ru_RU.utf8

#setenv LANG en_US.UTF-8
#alias  mani2mani "sudo /adm/bin/mani2mani.sh"

if ($?prompt) then
  if ( $?tcsh ) then
    bindkey "^W" backward-delete-word
    bindkey -k up history-search-backward
    bindkey -k down history-search-forward
  endif
endif
