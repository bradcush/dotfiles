# Add homebrew to PATH
if [[ $OSTYPE == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
