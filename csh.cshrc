# $FreeBSD: src/etc/csh.cshrc,v 1.3 1999/08/27 23:23:40 peter Exp $
#
# System-wide .cshrc file for csh(1).
#!/bin/csh

set	addsuffix
set	autolist
set	correct = cmd
set	color
set	ellipsis
set	filec
#set	autologout=120
set	history = 1000
set	savehist = 1000
alias parse_git_branch "git branch | & grep -v fatal | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'"

set	prompt = "%B%T%b %{[00;31m%}%n%{[01;37m%}@%{[00;32m%}%m%{[00m%}:%.02%#>"
#set	rprompt = "%T"
set	prompt2 = "%B%n%b>"
set	path = (/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin /var/lib/gems/1.8/bin)

umask	22                                                                          

setenv	EDITOR	vim
setenv	VISUAl	vim
setenv	PAGER	less
setenv	LESS	"-MQ"
setenv	BLOCKSIZE	K
setenv	GREP_COLOR	'1;37;44'
setenv	LSCOLORS	"exfxcxdxbxegedabagacad"
setenv	PERL5LIB	/usr/local/www/person/person.com/system/perl_util

alias	l		ls "-Hl --color=auto"
alias	ll		ls "-Hal --color=auto"
alias	v		vim
alias	s		screen -mA
alias	d		date
alias	j		jobs -l
alias	g		grep --color=auto
alias	pg		"ps aux | grep --color=auto"
alias	r		sudo -i
alias	ff		df -hit ufs

complete man 	'p/*/c/'
complete sudo	'p/*/c/'
complete kill	'p/*/`ps | awk \{print\ \$1\}`/'

complete find 	'n/-name/f/' 'n/-newer/f/' 'n/-{,n}cpio/f/' 'n/-exec/c/' 'n/-ok/c/' 'n/-user/u/' 'n/-group/g/' 'n/-fstype/(nfs 4.2)/' 'n/-type/(b c d f l p s)/' 'c/-/(name newer cpio ncpio exec ok user group fstype type atime ctime depth inum ls mtime nogroup nouser perm print prune size xdev)/' 'p/*/d/'

#alias   git_branch "git branch | sed -e 's/[ \\*]*//'"
#complete git  'n/checkout/`git_branch`/' 'n/pull/`git_branch`/' 'n/merge/`git_branch`/' 'p/*/(checkout branch tag commit status pull merge status whatchenged init-db)/'

if ( $?tcsh ) then
	bindkey "^W" backward-delete-word
	bindkey -k up history-search-backward
	bindkey -k down history-search-forward
	bindkey "^[[7~" beginning-of-line
	bindkey "^[[8~" end-of-line
	bindkey "^[[3~" delete-char
endif
