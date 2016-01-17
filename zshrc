export XDG_CONFIG_HOME=$HOME/.config
ZSH_HOME=$XDG_CONFIG_HOME/zsh
ENV_PARTS_DIR=$ZSH_HOME/zshenv.d
RC_PARTS_DIR=$ZSH_HOME/zshrc.d

parts=($ENV_PARTS_DIR $RC_PARTS_DIR)

# Load everything from parts directories
for dir in $parts; do
    for name in $(ls $dir/*.zsh); do
	source $name
    done
done
