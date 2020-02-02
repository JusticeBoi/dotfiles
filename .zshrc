
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/oguz/.oh-my-zsh"
#source ~/.zplug/init.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
bindkey -v
export KEYTIMEOUT=1

plugins=(git
        zsh-completions
        zsh-autosuggestions
        z
        vi-mode
        archlinux
        web-search
        extract)
        

autoload -U compinit && compinit
autoload predict-on
 lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
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

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
bindkey -s '^o' 'n\n'
#
#zplug "b4b4r07/zsh-vimode-visual"
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
#zplug "b4b4r07/zsh-vimode-visual", defer:3
#zplug load --verbose

#bindkey -s '^o' 'lfcd\n'

#
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

alias size='ncdu -x'
# open
alias op='xdg-open &>/dev/null'
alias lrzconnect=' sudo openconnect -u ga53zeg  asa-cluster.lrz.de'
alias prime='ssh 10.149.72.194'
alias gdiff='git diff'
alias cpu="watch -n 1 'cat /proc/cpuinfo | grep "MHz"'"
alias pls="sudo"
alias confi3="vim ~/.config/i3/config"
alias cppsearch="grep --include=\*.{cpp,hpp,h} -rnw . -e "
alias findLatestChanged="find . -type f -exec stat --format '%Y :%y %n' "{}" \; | sort -nr | cut -d: -f2- | head"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vim/vimrc"
alias scs="scrot --select"
alias sauce="source ~/.zshrc"
alias untar="tar xvf"
alias py="python3.8"
alias reconnect_eduroam="/home/oguz/./reconnect_to_eduroam"
alias headphoneConnect="bluetoothctl power on && bluetoothctl connect 38:18:4C:0E:67:C2"
alias headphoneDisconnect="bluetoothctl disconnect"
alias cp='/usr/local/bin/cpg -g'
alias mv='/usr/local/bin/mvg -g'
#alias pandoc="/home/oguz/softwares/pandoc-2.8.1/bin/./pandoc"
#alias itk="/home/oguz/softwares/itksnap-3.8.0-20190612-Linux-gcc64/bin/itksnap"
alias vtune="source /opt/intel/vtune_amplifier_2019.8.0.604197/amplxe-vars.sh && sudo /opt/intel/vtune_amplifier_2019/bin64/./amplxe-gui"
alias mountPlainDrive="udisksctl mount -b /dev/sda1"
alias mountEncrypted="udisksctl unlock -b /dev/sda2 && udisksctl mount -b /dev/dm-0"


# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
#__conda_setup="$('/home/oguz/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/oguz/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/oguz/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/oguz/anaconda3/bin:$PATH"
#    fi  
#fi
#unset __conda_setup

export PATH=/opt/intel/bin:$PATH
export PATH=/usr/local/bin/python3.7/bin:$PATH

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/intel/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH

#export ANDROID_HOME=/home/oguz/sdkmanager/tools
#export ANDROID_SDK_ROOT=/home/oguz/sdkmanager/tools/tools
#export LD_LIBRARY_PATH=/usr/lib/clang/8/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:/usr/local/gcc-8.3/lib64:/usr/local/gcc-9.1/lib64:$LD_LIBRARY_PATH"
#export GEM_HOME="$HOME/gems"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/oguz/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/oguz/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/oguz/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/oguz/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#source /home/oguz/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ./zsh-vimode-visual/zsh-vimode-visual.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
