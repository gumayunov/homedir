
umask 2
unset autologout

set path = ($path $HOME/bin )

if [ `uname` == 'Linux' ]; then
  alias   ll    ls "-Hhal --color=auto"
else
  alias   ll    ls "-HhGal"
fi

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
