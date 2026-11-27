eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG="en_US.UTF-8"

source <(fzf --zsh)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -d ".venv" ] && [ -f ".venv/bin/activate" ]; then
  source .venv/bin/activate
fi

export PATH="/Library/Developer/CommandLineTools/usr/bin:$PATH"
alias dotfiles="cd $HOME/Developer/dotfiles"
export EDITOR='nvim'
export VISUAL='nvim'
alias lg="lazygit"

alias yr='cal -y'
alias e=nvim
alias m=make
alias o=open
alias g=git
alias gc='git checkout'
alias ga='git add -p'
alias vimdiff='nvim -d'
alias gah 'git stash; and git pull --rebase; and git stash pop'
