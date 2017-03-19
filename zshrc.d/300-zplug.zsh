# ===========================================================================
# Init zplug
# ===========================================================================

# First-time run: need to download zplug if it doesn't exist
[[ -f $ZPLUG_HOME/init.zsh ]] || (echo "zplug missing, please install https://github.com/zplug/zplug to $ZPLUG_HOME" && exit 1)
source $ZPLUG_HOME/init.zsh

# ===========================================================================
# Plugins
# ===========================================================================


# zsh plugins
zplug "petervanderdoes/git-flow-completion"
zplug "zsh-users/zsh-completions"

# pure prompt
# zplug "mafredri/zsh-async", nice:1
# zplug "sindresorhus/pure", nice:2

# fzf
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:fzf, \
    use:"*linux*amd64*"
zplug "junegunn/fzf", defer:1

# others
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "tarruda/zsh-autosuggestions", defer:3
zplug "chrissicool/zsh-256color"

# Manage zplug
zplug "zplug/zplug"


# ===========================================================================
# Install plugins
# ===========================================================================

# Install plugins if they've not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
	echo; zplug install
    fi
fi

# ===========================================================================
# Load plugins
# ===========================================================================

zplug load

# ===========================================================================
#
# ===========================================================================
