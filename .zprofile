eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG="en_US.UTF-8"

source <(fzf --zsh)

if [ -d ".venv" ] && [ -f ".venv/bin/activate" ]; then
  source .venv/bin/activate
fi

export dotfiles="$HOME/Developer/dotfiles"

