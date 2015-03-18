# Aliases.
alias ls='ls --color'
alias l='ls -alF'

# git
alias gs='git status -s'
alias gc='git commit'
alias gp='git push origin'
alias gpr='git pull --rebase'
alias gpu='git pull'

alias dotfiles='cd ~/.dotfiles'

alias ag='/usr/bin/ag'

# conditional alias
type vim.gnome >> /dev/null && alias vim=vim.gnome
# type gvim >> /dev/null && alias vim=gvim