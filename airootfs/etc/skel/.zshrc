###
# Prezto Initi
###
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

###
# Start X
###
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
