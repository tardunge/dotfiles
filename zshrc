# ZSH configuration.

# Path to Dotfiles dir clone.
export DOTFILES="$HOME/dotfiles"

# disable auto correct
setopt nocorrectall

# Source ohmyzsh config.
[[ -s $DOTFILES/ohmyzsh ]] && source $DOTFILES/ohmyzsh

# Source aliases
[[ -s $DOTFILES/profile ]] && source $DOTFILES/profile

 #disable auto correct
setopt nocorrectall

# GENERAL VARIABLES
export LC_ALL=en_US.UTF-8
export MANPATH="/usr/bin/man:$MANPATH"
export LANG=en_US.UTF-8
# export CLOUDSDK_PYTHON=/Users/manojbabu/.pyenv/versions/neovim3/bin/python
# export CLOUDSDK_PYTHON_SITEPACKAGES=1
export KUBE_EDITOR="nvim"

# nord dir-colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Go Workspace
export GOPATH=$HOME/go
export GOROOT="$(asdf where golang)/go/"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# source pyenv
# Use pyenv to manage python versions. asdf has trouble with apple m1 processors
[[ -s $DOTFILES/pyenv ]] && source $DOTFILES/pyenv
# [[ -s $DOTFILES/sqlite ]] && source $DOTFILES/sqlite

# source bat settings
[[ -s $DOTFILES/bat ]] && source $DOTFILES/bat


# source after PATH variable modifications are done.
#[[ -s $DOTFILES/asdf/asdf ]] && source $DOTFILES/asdf/asdf
. ~/.asdf/plugins/java/set-java-home.zsh

# source fzf and its conf
[[ -s $DOTFILES/fzf ]] && source $DOTFILES/fzf

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/manojbabu/.sdkman"
[[ -s "/Users/manojbabu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/manojbabu/.sdkman/bin/sdkman-init.sh"

eval "$(direnv hook zsh)"
# utility func to benchmark zsh load time
# USE Hyperfine
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tardunge/medica/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tardunge/medica/google-cloud-sdk/path.zsh.inc'; fi

# PKG CONFIG -- required for icu4c

# icu4c is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS provides libicucore.dylib (but nothing else).

# If you need to have icu4c first in your PATH, run:
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"

# For compilers to find icu4c you may need to se
export LDFLAGS="-L/opt/homebrew/opt/icu4c/lib"
export CPPFLAGS="-I/opt/homebrew/opt/icu4c/include"

# For pkg-config to find icu4c you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Switch to rustup version
use_rustup() {
    export PATH="$HOME/.cargo/bin:$PATH"
    echo "Switched to rustup Rust"
}

# Switch to asdf version
use_asdf() {
    export PATH="$HOME/.asdf/shims:$PATH"
    echo "Switched to asdf Rust"
}

# Added by Windsurf
export PATH="/Users/tardunge/.codeium/windsurf/bin:$PATH"

# Add Nix to PATH
export PATH="/nix/var/nix/profiles/default/bin:$PATH"

. "$HOME/.local/bin/env"
