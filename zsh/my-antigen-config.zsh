# Load the default oh-my-zsh library by robbyrussell
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# A fully-featured powerline-like theme:
antigen theme romkatv/powerlevel10k

# Tell antigen that we're done.
antigen apply
