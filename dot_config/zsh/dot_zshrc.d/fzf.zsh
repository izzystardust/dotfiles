local fzf_preview="[[ -d {} ]] && tree -t --dirsfirst -C -L 1 {} | head -150 ||bat --style=numbers --color=always --line-range :500 {}" 

_fzf_comprun() {
	local command=$1
	shift

	case $command in
		cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
		vim) fzf "$@" --preview "$fzf_preview" ;;
		*) fzf "$@" ;;
	esac
}

[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border=sharp'

export FZF_CTRL_T_OPTS="--preview '$fzf_preview' --exit-0"
