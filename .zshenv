if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export TERMINAL="st"
export BROWSER="firefox"
export HISTCONTROL=ignoreboth
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export _JAVA_AWT_WM_NONREPARENTING=1
export NNN_TRASH=1
export NNN_PLUG='o:fzopen;i:imgview;u:imgur;m:mp3conv'
export NNN_USE_EDITOR=1

export PATH=/opt/intel/bin:$PATH
export PATH=/usr/local/bin/python3.7/bin:$PATH

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/intel/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH


