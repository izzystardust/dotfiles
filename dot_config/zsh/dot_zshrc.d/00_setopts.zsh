bindkey -e

autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

setopt combining_chars
setopt interactive_comments
setopt rc_quotes
setopt auto_resume

setopt extended_glob

# http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories
setopt auto_cd                 # if a command isn't valid, but is a directory, cd to that dir
setopt auto_pushd              # make cd push the old directory onto the directory stack
setopt pushd_ignore_dups       # don’t push multiple copies of the same directory onto the directory stack
setopt pushd_minus             # exchanges the meanings of ‘+’ and ‘-’ when specifying a directory in the stack
setopt pushd_silent

setopt notify
setopt long_list_jobs
setopt no_mail_warning
setopt no_rm_star_silent # confirm rm with glob
setopt always_to_end
setopt auto_list
setopt no_flow_control
setopt no_beep
