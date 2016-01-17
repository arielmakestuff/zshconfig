# =================================================================

# =================== ORIGINAL CUSTOM PROMPT ======================

# Enable colors in prompt
# autoload -U colors && colors 

# for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY BROWN; do
#    eval "FG_${color:u}=\"%{${fg_no_bold[${color:l}]}%}\""
#    eval "FG_BOLD_${color:u}=\"%{${fg_bold[${color:l}]}%}\""
#    (( count = $count + 1 ))
# done
# FG_DEFAULT="%{${fg_no_bold[default]}${bg[default]}%}"
 
# PS1=$'\n'\
# "%(!.${FG_BOLD_RED}!!!WARNING!!! .${FG_BOLD_GREEN})%(!.$FG_BOLD_RED.$FG_BOLD_GREEN)%(!.${USERNAME:u} USER.%n@%M)%(!.${FG_BOLD_RED}!!!.${FG_BOLD_GREEN}) ${FG_DEFAULT}"\
# "${FG_WHITE}zsh ${ZSH_VERSION} ${FG_YELLOW}%D{%a %B %d %Y} %D{%I:%M:%S %p} "\
# $'\n'\
# "${FG_MAGENTA}%80<...<Current Dir: ${FG_CYAN}%d%<<"\
# $'\n'\
# "${FG_DEFAULT}%# "

# PS2='>'


# =================================================================

# =================== VI PROMPT ===================================
# Note: colors are defined in 101-color.zsh

# autoload -U promptinit && promptinit
# autoload -U colors     && colors

# setopt prompt_subst

# Set the colors to your liking
local vi_normal_marker="[%{$fg[green]%}%BN%b%{$reset_color%}]"
local vi_insert_marker="[%{$fg[cyan]%}%BI%b%{$reset_color%}]"
local vi_unknown_marker="[%{$fg[red]%}%BU%b%{$reset_color%}]"
local vi_mode="$vi_insert_marker"

vi_mode_indicator () 
{
    case ${KEYMAP} in
	(vicmd)      echo $vi_normal_marker ;;
	(main|viins) echo $vi_insert_marker ;;
	(*)          echo $vi_unknown_marker ;;
    esac
}

# Reset mode-marker and prompt whenever the keymap changes
function zle-line-init zle-keymap-select 
{
    vi_mode="$(vi_mode_indicator)"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Multiline-prompts don't quite work with reset-prompt; we work around this by
# printing the first line(s) via a precmd which is executed before the prompt
# is printed.  The following can be integrated into PROMPT for single-line
# prompts.
#
local username='%B%n%b'
local host='%m'

# Colorize freely
# Colors are set like: $FG[$colorcode]
# See 101-color.zsh spectrum_ls function for list of color codes
local user_host="${FG[010]}${username}@${FG[151]}${host}${RESET_COLOR}"
local current_dir="${FG[219]}%~${RESET_COLOR}"
precmd () 
{
    # local git_info="$(parse_git_state)"
    print -rP "${user_host} ${current_dir} $(git_prompt_string)"
}

local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
PROMPT='${return_code}${vi_mode} %# '


# =================================================================

# =================================================================
