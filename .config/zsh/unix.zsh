# Cross-platform configuration

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode poetry)
source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR='vim'

# Custom functions
function title {
    echo -ne "\033]0;"$*"\007"
}

# Aliases
alias ghlink='
if git rev-parse --git-dir > /dev/null 2>&1; then
    REPO_URL=$(git config --get remote.origin.url | sed "s/git@github.com://g" | sed "s/.git//g")
    BRANCH=$(git branch --show-current)
    echo "https://github.com/$REPO_URL/tree/$BRANCH"
else
    echo "Not a git repository"
fi'

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=auto

# pipx
export PATH="$PATH:$HOME/.local/bin"

# Auto-start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Graphite completions
compdef gt 2>/dev/null
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt 2>/dev/null
