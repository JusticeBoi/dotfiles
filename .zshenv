export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export HISTCONTROL=ignoreboth
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export _JAVA_AWT_WM_NONREPARENTING=1
export NNN_TRASH=1
export NNN_PLUG='o:fzopen;i:imgview;u:imgur;m:mp3conv'
export NNN_USE_EDITOR=1


