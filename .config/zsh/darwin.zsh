# macOS-specific configuration

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_DIR=/opt/homebrew
export HOMEBREW_BIN=/opt/homebrew/bin

# Python version manager
eval "$(pyenv init -)"

# Prefer GNU binaries to macOS BSD binaries
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# libpq (postgres)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Keychain helper - use this pattern for secrets:
# export MY_SECRET=$(security find-generic-password -a ${USER} -s my_secret_name -w)

# SSH agent with Apple Keychain
# ssh-add --apple-use-keychain ~/.ssh/my_key 2>/dev/null
