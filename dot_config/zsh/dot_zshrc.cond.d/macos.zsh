[[ "$OSTYPE" == darwin* ]] || exit 0
if [[ ! $(type brew) ]]; then
    echo "Uh oh! Homebrew isn't in the PATH!"
    exit 1
fi
brew_prefix=$(brew --prefix)

# Shell completions for programs installed via Homebrew
fpath=("$brew_prefix/share/zsh-completions" $fpath)

path_to_z=$brew_prefix/etc/profile.d

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
