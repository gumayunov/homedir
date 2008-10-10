# $FreeBSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#


# A righteous umask
umask 2

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin /adm/bin)

alias   ll      ls "-Hal --color=auto"
alias   pg      "ps aux | grep --color=auto"
alias   rg      "~/.tools/rg"

setenv LESS -MQR
#setenv LANG ru_RU.KOI8-R
#etenv LANG ru_RU.utf8

if ($?prompt) then
  if ( $?tcsh ) then
    bindkey "^W" backward-delete-word
    bindkey -k up history-search-backward
    bindkey -k down history-search-forward
  endif
endif
