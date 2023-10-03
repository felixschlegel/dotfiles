export ZSH=$HOME/.zsh

source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

# disable bell
unsetopt beep

export OPAM_SWITCH_PREFIX='/Users/Felix/.opam/default'
export CAML_LD_LIBRARY_PATH='/Users/Felix/.opam/default/lib/stublibs:/Users/Felix/.opam/default/lib/ocaml/stublibs:/Users/Felix/.opam/default/lib/ocaml'
export OCAML_TOPLEVEL_PATH='/Users/Felix/.opam/default/lib/toplevel'
export PATH='/Users/Felix/.opam/default/bin:/usr/local/bin:/opt/homebrew/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/Users/FelixSchlegel/mongodb/bin:/opt/X11/bin:/Library/Apple/usr/bin:/Library/TeX/texbin'
export PATH="/opt/homebrew/bin/ruby:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export JAVA_HOME="$(/usr/libexec/java_home -V)"

# show git branch in terminal prompt (https://gist.github.com/reinvanoyen/05bcfe95ca9cb5041a4eafd29309ff29)
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# Enable git branch auto completion
autoload -Uz compinit && compinit

# Share history between sessions
setopt share_history

# Cycle through incremental history-based suggestions
bindkey -v "^J" history-beginning-search-backward
bindkey -v "^K" history-beginning-search-forward

# vim mode
bindkey -v
