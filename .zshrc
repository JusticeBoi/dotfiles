autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
setopt prompt_subst
stty stop undef		# Disable ctrl-s to freeze terminal.

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

autoload -U compinit  
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


fpath=(/home/oguz/.config/zsh/plugins/zsh-completions/src $fpath)

export XDG_DATA_HOME="/home/oguz/.config"  
export CCACHE_DIR="$XDG_DATA_HOME/ccache" 

export PYLINTHOME="/home/oguz/.config/pylint"
export _Z_DATA="$XDG_DATA_HOME/z/.z"


source ~/.config/zsh/plugins/you-should-use.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/z/z.sh
source ~/.config/zsh/plugins/completion.zsh
source ~/.config/zsh/plugins/directories.zsh
source ~/.config/zsh/plugins/extract/extract.plugin.zsh

compinit -i -C
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

#vimode
bindkey -v
bindkey '^P' up-history
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# function git_current_branch() {
#   local ref
#   ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
#   local ret=$?
#   if [[ $ret != 0 ]]; then
#     [[ $ret == 128 ]] && return  # no git repo.
#     ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
#   fi
#   echo ${ref#refs/heads/}
# }



function zle-keymap-select {
  # echo ${KEYMAP}
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}
#vimode end

export LSCOLORS="Gxfxcxdxbxegedabagacad"
# For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload predict-on
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -e "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

bindkey -s '^o' 'n\n'
#
# export ZSH="$XDG_DATA_HOME/oh-my-zsh"
# source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

fdgo() {
     res=$(fd "$1" | head -n 1)
     if [ -z "$res" ]
     then
         echo " couldn't find it "
     else
         cd $(dirname $res)
     fi
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/.config/zsh/plugins/print_message.zsh
