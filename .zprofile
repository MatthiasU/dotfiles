eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG="en_US.UTF-8"

source <(fzf --zsh)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -d ".venv" ] && [ -f ".venv/bin/activate" ]; then
  source .venv/bin/activate
fi

alias dotfiles="cd $HOME/Developer/dotfiles"
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="/Library/Developer/CommandLineTools/usr/bin:$PATH"
alias lg="lazygit"
