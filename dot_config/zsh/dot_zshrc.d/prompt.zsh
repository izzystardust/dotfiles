setopt prompt_subst
# Load required functions.
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

function prompt_izzy_precmd {
  vcs_info 'prompt'
}

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd prompt_izzy_precmd

# Use extended color pallete if available.
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
  _prompt_izzy_colors=(
    "%F{cyan}"
    "%F{yellow}"
    "%F{147}" # Purple, 147
    "%F{green}" # Limegreen
  )
else
  _prompt_izzy_colors=(
    "%F{cyan}"
    "%F{yellow}"
    "%F{magenta}"
    "%F{green}"
  )
fi

# Formats:
#   %b - branchname
#   %u - unstagedstr (see below)
#   %c - stagedstr (see below)
#   %a - action (e.g. rebase-i)
#   %R - repository path
#   %S - path in the repository
local usual_format="(${_prompt_izzy_colors[1]}%b%f)"
local action_format="(${_prompt_izzy_colors[4]}%a%f)"
# local unstaged_format="${_prompt_izzy_colors[2]}●unstage%f"
# local staged_format="${_prompt_izzy_colors[4]}●stage%f"

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable git
# These can be slow...
# zstyle ':vcs_info:*:prompt:*' check-for-changes true
# zstyle ':vcs_info:*:prompt:*' unstagedstr "${unstaged_format}"
# zstyle ':vcs_info:*:prompt:*' stagedstr "${staged_format}"
zstyle ':vcs_info:*:prompt:*' actionformats "${usual_format}${action_format}"
zstyle ':vcs_info:*:prompt:*' formats "${usual_format}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

PROMPT="${_prompt_izzy_colors[3]}%n%f at ${_prompt_izzy_colors[2]}%m%f in ${_prompt_izzy_colors[4]}%~%f "'${VIRTUAL_ENV+🌀 }${vcs_info_msg_0_}'"
$ "
RPROMPT='%(?. %?.)'
# vim: ft=zsh
