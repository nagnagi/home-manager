# zmodload zsh/zprof

# Created by newuser for 5.9
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_space
setopt autocd
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt correct

bindkey -e

# bindkey -v
# set -o vi
# 
# bindkey -M viins '^A' beginning-of-line
# bindkey -M viins '^E' end-of-line
# bindkey -M viins '^F' forward-char
# bindkey -M viins '^B' backward-char
# bindkey -M viins '^P' up-history
# bindkey -M viins '^N' down-history
# bindkey -M viins '^R' history-incremental-search-backward
# bindkey -M viins '^K' kill-line
# bindkey -M viins '^Y' yank
# bindkey -M viins '^W' backward-kill-word
# bindkey -M viins '^D' delete-char
# bindkey -M viins 'jk' vi-cmd-mode

export KEYTIMEOUT=1

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nag/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors di='34;1' ex='32;1' '=*.c=33;1' '=*.py=33;1' '=README*=33;1;4'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate' max-errors 3 NUMERIC
zstyle ':completion:*' completer _complete _approximate _prefix _correct

autoload -Uz compinit
compinit -C -u
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit light zdharma/history-search-multi-word
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
# zinit light olets/zsh-abbr
zinit light wfxr/forgit
zinit light ajeetdsouza/zoxide
zinit light junegunn/fzf
zinit ice depth=1

# zinit light jeffreytse/zsh-vi-mode
# zinit light djui/alias-tips
# zinit light MichaelAquilina/zsh-you-should-use

# prompt settings
autoload -Uz colors
colors

autoload -Uz promptinit
promptinit

autoload -Uz add-zsh-hook
autoload -Uz add-zle-hook-widget

_prompt_gen() {
    local exit_code=$?

    local env_prompt=""
    local env_prompt_list=()
    local prompt_color_list=()
    local symbol_prompt=">"

    local machine_prompt=""
    local path_prompt="%F{green}%~%f"
    local status_prompt=""

    local git_branch_prompt=""

    # if [ -n "$DIRENV_DIR" ]; then
    #     env_prompt_list=(" " $env_prompt_list)
    #     prompt_color_list=("white" $prompt_color_list)
    # fi

    if [ -n "$NIX_STORE" ]; then
        env_prompt_list=(" " $env_prompt_list)
        prompt_color_list=("#5277C3" $prompt_color_list)
    fi

    if [ -n "$VIRTUAL_ENV" ]; then
        env_prompt_list=(" " $env_prompt_list)
        prompt_color_list=("#FFD43B" $prompt_color_list)
    fi

    if [ -n "$SSH_CONNECTION" ]; then
        machine_prompt="%F{green}%n@%m%f:"
        path_prompt="%F{cyan}%c%f"
    fi

    local git_branch=$(git branch --show-current 2> /dev/null)
    if [[ -n "$git_branch" ]]; then
        git_branch_prompt=" %F{#F05032} ${git_branch}%f"
        # env_prompt_list=(" " $env_prompt_list)
        # prompt_color_list=("#F05032" $prompt_color_list)
    fi

    if [[ "$exit_code" != "0" ]]; then
        status_prompt=" %F{red}[${exit_code}]%f"
        env_prompt="%F{red}"
        for i in {1..${#env_prompt_list}}; do
            env_prompt="${env_prompt}${env_prompt_list[$i]}"
        done
        env_prompt="${env_prompt}${symbol_prompt}%f"
    else
        for i in {1..${#env_prompt_list}}; do
            env_prompt="${env_prompt}%F{${prompt_color_list[$i]}}${env_prompt_list[$i]}%f"
        done
        if [[ "${#env_prompt_list}" == "0" ]]; then
            env_prompt="${symbol_prompt}"
        else
            env_prompt="${env_prompt}%F{${prompt_color_list[-1]}}${symbol_prompt}%f"
        fi
    fi

    PROMPT="${env_prompt} "
    RPROMPT="${machine_prompt}${path_prompt}${git_branch_prompt}${status_prompt}"
}
add-zsh-hook precmd _prompt_gen

function prompt-gen() {
    PROMPT="%(?.>.%F{red}>%f) "
}

# [[maybe unused]]
function zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    PROMPT="%(?.<.%F{red}>%f) "
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ $1 = 'beam' ]]; then
    PROMPT="%(?.>.%F{red}>%f) "
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-init() {
  zle -K viins
}
# zle -N zle-line-init

# OSC2
_title_preexec() {
    print -n "\e]2;${1[(w)1]} - foot\a"
}
_title_precmd()  {
    print -Pn "\e]2;%~ - foot\a"
}
add-zsh-hook preexec _title_preexec
add-zsh-hook precmd  _title_precmd

# OSC7
osc7_cwd() {
    # ディレクトリをURLエンコードしてOSC 7を送信
    printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$PWD"
}
add-zsh-hook chpwd osc7_cwd

# multiplexer
if [ "$ZELLIJ" ]; then
	export TERM=xterm-256color
fi

# home-manager
# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# application settings
## zoxide
alias cd='z'
alias zi='__zoxide_zi'
# eval "$(zoxide init zsh)"
# source $HOME/.zsh/zoxide.zsh

## fuck
# eval $(thefuck --alias)
# source $HOME/.zsh/thefuck.zsh

## exa
alias ls='eza'

## ruby
# export GEM_HOME="$HOME/.local/share/gem/ruby/3.4.0"
# export PATH="$PATH:$GEM_HOME/bin"
# export PATH="$PATH:$HOME/.rbenv/bin"

# eval "$(rbenv init -)"
# source $HOME/.zsh/rbenv.zsh

# uv
# . "$HOME/.local/bin/env"
# eval "$(uv generate-shell-completion zsh)"
# source $HOME/.zsh/uv.zsh

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
# [[ ! -r '/home/nag/.opam/opam-init/init.zsh' ]] || source '/home/nag/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# precmd_functions=( ${precmd_functions:#_opam_env_hook} )
# preexec_functions=( ${preexec_functions:#_opam_env_hook} )

# eval $(opam env)
# source $HOME/.zsh/opam.zsh
# END opam configuration

# ranger
ranger-cd() {
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$PWD}"
    if [ -f "$tempfile" ]; then
        local newdir="$(cat "$tempfile")"
        if [ -n "$newdir" ] && [ "$newdir" != "$PWD" ]; then
            cd -- "$newdir"
        fi
        rm -f -- "$tempfile"
    fi
}
# alias ranger='ranger-cd'

# direnv
# eval "$(direnv hook zsh)"
source $HOME/.zsh/direnv.zsh

# alipath
# eval $(alipath --env zsh)
# source $HOME/.zsh/alipath.zsh

# reportools
# eval $(reportools --env zsh)
# source $HOME/.zsh/reportools.zsh
 
# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | awk '!seen[$0]++' | fzf --query "$LBUFFER" --reverse --tiebreak=index --height 20)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# pkgfile
# source /usr/share/doc/pkgfile/command-not-found.zsh

# path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/user:$PATH"
export PATH="$PATH:$HOME/.lmstudio/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# env
# export XDG_CURRENT_DESKTOP=Hyprland

# API KEY
source $HOME/.zsh/secret/apikey.zsh

# alias
alias la='ls -a'
alias ll='ls -al'
alias l='ls'

alias ...='cd ../..'
alias ....='cd ../..'

alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gP='git push'
alias gp='git pull'
alias gf='git fetch'
alias gch='git checkout'

alias dcu='docker compose up --build -d'
alias dcd='docker compose down'
alias ddv='docker compose down -v'

alias vibe='vibe-wrapper'

bindkey '^l' autosuggest-accept

# zprof
