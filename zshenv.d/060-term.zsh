# =================================================================
# Terminal Settings
# =================================================================


# export TERM=xterm-256color
if [[ -z $DISPLAY ]]; then
    export TERM=linux
else
    # export TERM=rxvt-unicode-256color
    # export TERM=screen-256color
    # export TERM=tmux-256color
    export COLORTERM=truecolor
fi


# =================================================================
#
# =================================================================
