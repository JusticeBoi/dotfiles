# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.

### TO ENABLE P10K
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/oguz/.oh-my-zsh"
autoload -U colors && colors
#source ~/.zplug/init.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

### TO ENABLE P10K
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
        extract)
        

autoload -U compinit && compinit
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


autoload predict-on
 # lfcd () {
 #    tmp="$(mktemp)"
 #    lf -last-dir-path="$tmp" "$@"
 #    if [ -f "$tmp" ]; then
 #        dir="$(cat "$tmp")"
 #        rm -f "$tmp"
 #        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
 #    fi
# }
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
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}



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
alias drive='/run/media/oguz/071E-7618'
alias h='htop'
alias t='~/Documents/Thesis'
alias tt='~/Documents/Thesis/thesis_latex'
alias tr='~/Documents/Thesis/reading'
alias rgrep='grep -r'
# open
alias o='xdg-open &>/dev/null'
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
# alias untar="tar xvf"
alias py="python3.8"
alias c="./compile_thesis"
alias ct="pdflatex -interaction=nonstopmode -halt-on-error -synctex=1 thesis.tex"
alias p="pdflatex -interaction=nonstopmode -halt-on-error -synctex=1"
# alias reconnect_eduroam="/home/oguz/./reconnect_to_eduroam"
alias headphoneConnect="bluetoothctl power on && bluetoothctl connect 38:18:4C:0E:67:C2"
alias headphoneDisconnect="bluetoothctl disconnect"
alias cp='/usr/local/bin/cpg -g'
alias mv='/usr/local/bin/mvg -g'
#alias pandoc="/home/oguz/softwares/pandoc-2.8.1/bin/./pandoc"
#alias itk="/home/oguz/softwares/itksnap-3.8.0-20190612-Linux-gcc64/bin/itksnap"
alias vtune="source /opt/intel/vtune_amplifier_2019.8.0.604197/amplxe-vars.sh && sudo /opt/intel/vtune_amplifier_2019/bin64/./amplxe-gui"
alias mountPlainDrive="udisksctl mount -b /dev/sda1"
alias mountEncrypted="udisksctl unlock -b /dev/sda2 && udisksctl mount -b /dev/dm-0"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

fdgo() {
     res=$(fd "$1" | head -n 1)
     if [ -z "$res" ]
     then
         echo " couldn't find it "
     else
         cd $(dirname $res)
     fi
}
calc(){ echo "scale=5;" $@ | bc -l; }

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#

export PATH=/opt/intel/bin:$PATH
export PATH=/usr/local/bin/python3.7/bin:$PATH

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/intel/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH
#export LD_PRELOAD=/usr/local/lib/libjemalloc.so

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
print_message () {

    local messages
    local message

    declare -a array1=(
        "Boooo!"
        "Don't you know anything?"
        "RTFM!"
        "Haha, n00b!"
        "Wow! That was impressively wrong!"
        "Pathetic"
        "The worst one today!"
        "n00b alert!"
        "Your application for reduced salary has been sent!"
        "lol"
        "u suk"
        "lol... plz"
        "plz uninstall"
        "And the Darwin Award goes to.... ${USER}!"
        "ERROR_INCOMPETENT_USER"
        "Incompetence is also a form of competence"
        "Bad."
        "Fake it till you make it!"
        "What is this...? Amateur hour!?"
        "Come on! You can do it!"
        "Nice try."
        "What if... you type an actual command the next time!"
        "What if I told you... it is possible to type valid commands."
        "Y u no speak computer???"
        "This is not Windows"
        "Perhaps you should leave the command line alone..."
        "Please step away from the keyboard!"
        "error code: 1D10T"
        "ACHTUNG! ALLES TURISTEN UND NONTEKNISCHEN LOOKENPEEPERS! DAS KOMPUTERMASCHINE IST NICHT FÜR DER GEFINGERPOKEN UND MITTENGRABEN! ODERWISE IST EASY TO SCHNAPPEN DER SPRINGENWERK, BLOWENFUSEN UND POPPENCORKEN MIT SPITZENSPARKEN. IST NICHT FÜR GEWERKEN BEI DUMMKOPFEN. DER RUBBERNECKEN SIGHTSEEREN KEEPEN DAS COTTONPICKEN HÄNDER IN DAS POCKETS MUSS. ZO RELAXEN UND WATSCHEN DER BLINKENLICHTEN."
        "Pro tip: type a valid command!"
        "Go outside."
        "This is not a search engine."
        "(╯°□°）╯︵ ┻━┻"
        "¯\_(ツ)_/¯"
        "So, I'm just going to go ahead and run rm -rf / for you."
        "Why are you so stupid?!"
        "Perhaps computers is not for you..."
        "Why are you doing this to me?!"
        "Don't you have anything better to do?!"
        "I am _seriously_ considering 'rm -rf /'-ing myself..."
        "This is why you get to see your children only once a month."
        "This is why nobody likes you."
        "Are you even trying?!"
        "Try using your brain the next time!"
        "My keyboard is not a touch screen!"
        "Commands, random gibberish, who cares!"
        "Typing incorrect commands, eh?"
        "Are you always this stupid or are you making a special effort today?!"
        "Dropped on your head as a baby, eh?"
        "Brains aren't everything. In your case they're nothing."
        "I don't know what makes you so stupid, but it really works."
        "You are not as bad as people say, you are much, much worse."
        "Two wrongs don't make a right, take your parents as an example."
        "You must have been born on a highway because that's where most accidents happen."
        "If what you don't know can't hurt you, you're invulnerable."
        "If ignorance is bliss, you must be the happiest person on earth."
        "You're proof that god has a sense of humor."
        "Keep trying, someday you'll do something intelligent!"
        "If shit was music, you'd be an orchestra."
        "How many times do I have to flush before you go away?"
    )
    declare -a array2=(
        "A most notable coward, an infinite and endless liar, an hourly promise breaker, the owner of no one good quality."
        "Away, you starvelling, you elf-skin, you dried neat's-tongue, bull's-pizzle, you stock-fish!"
        "Away, you three-inch fool! "
        "Come, come, you froward and unable worms!"
        "Go, prick thy face, and over-red thy fear, Thou lily-liver’d boy."
        "His wit's as thick as a Tewkesbury mustard."
        "I am pigeon-liver'd and lack gall."
        "I am sick when I do look on thee "
        "I must tell you friendly in your ear, sell when you can, you are not for all markets."
        "If thou wilt needs marry, marry a fool; for wise men know well enough what monsters you make of them."
        "I'll beat thee, but I would infect my hands."
        "I scorn you, scurvy companion. "
        "Methink'st thou art a general offence and every man should beat thee."
        "More of your conversation would infect my brain."
        "My wife's a hobby horse!"
        "Peace, ye fat guts!"
        "Poisonous bunch-backed toad! "
        "The rankest compound of villainous smell that ever offended nostril"
        "The tartness of his face sours ripe grapes."
        "There's no more faith in thee than in a stewed prune."
        "Thine forward voice, now, is to speak well of thine friend; thine backward voice is to utter foul speeches and to detract."
        "That trunk of humours, that bolting-hutch of beastliness, that swollen parcel of dropsies, that huge bombard of sack, that stuffed cloak-bag of guts, that roasted Manningtree ox with pudding in his belly, that reverend vice, that grey Iniquity, that father ruffian, that vanity in years?"
        "Thine face is not worth sunburning."
        "This woman's an easy glove, my lord, she goes off and on at pleasure."
        "Thou art a boil, a plague sore."
        "Was the Duke a flesh-monger, a fool and a coward?"
        "Thou art as fat as butter."
        "Here is the babe, as loathsome as a toad."
        "Like the toad; ugly and venomous."
        "Thou art unfit for any place but hell."
        "Thou cream faced loon"
        "Thou clay-brained guts, thou knotty-pated fool, thou whoreson obscene greasy tallow-catch!"
        "Thou damned and luxurious mountain goat."
        "Thou elvish-mark'd, abortive, rooting hog!"
        "Thou leathern-jerkin, crystal-button, knot-pated, agatering, puke-stocking, caddis-garter, smooth-tongue, Spanish pouch!"
        "Thou lump of foul deformity"
        "That poisonous bunch-back'd toad!"
        "Thou sodden-witted lord! Thou hast no more brain than I have in mine elbows "
        "Thou subtle, perjur'd, false, disloyal man!"
        "Thou whoreson zed , thou unnecessary letter!"
        "Thy sin’s not accidental, but a trade."
        "Thy tongue outvenoms all the worms of Nile."
        "Would thou wert clean enough to spit upon"
        "Would thou wouldst burst!"
        "You poor, base, rascally, cheating lack-linen mate! "
        "You are as a candle, the better burnt out."
        "You scullion! You rampallian! You fustilarian! I’ll tickle your catastrophe!"
        "You starvelling, you eel-skin, you dried neat's-tongue, you bull's-pizzle, you stock-fish-O for breath to utter what is like thee!-you tailor's-yard, you sheath, you bow-case, you vile standing tuck!"
        "Your brain is as dry as the remainder biscuit after voyage."
        "Virginity breeds mites, much like a cheese."
        "Villain, I have done thy mother"
    )
    declare -a array3=(
        "You live like simple cattle or irrational pigs and, despite the fact that the gospel has returned, have mastered the fine art of misusing all your freedom."
        "You shameful gluttons and servants of your bellies are better suited to be swineherds and keepers of dogs."
        "You deserve not only to be given no food to eat, but also to have the dogs set upon you and to be pelted with horse manure."
        "Oh, what mad senseless fools you are!"
        "For this you deserve to have God deprive you of his Word and blessing and once again allow preachers of lies to arise who lead you to the devil - and wring sweat and blood out of you besides."
        "All your holiness is only stench and filth, and it merits nothing but wrath and damnation."
        "May your grain spoil in the barn, your beer in the cellar, your cattle perish in the stall. Yes, your entire hoard ought to be consumed by rust so that you will never enjoy it."
        "You relish and delight in the chance to stir up someone else's dirt like pigs that roll in manure and root around in it with their snouts."
        "Your sin smells to high heaven."
        "Your words are so foolishly and ignorantly composed that I cannot believe you understand them."
        "You are the most insane heretics and ingrafters of heretical perversity."
        "What you say is a blasphemy that has made you worthy of a thousand deaths."
        "Behold, indeed, this little golden work of a golden teacher! It is a work most worthy of golden letters, and lest there be something about it which is not golden, it must be handed down by golden disciples, namely, by those about whom it is said, 'The idols of the nations are silver and gold. They have eyes, but they see not.'"
        "You are worthy only to be mocked by the words of error."
        "It is presumptuous for people who are as ignorant as you are not to take up the work of a herdsman."
        "What bilgewater of heresies has ever been spoken so heretically as what you have said?"
        "What do you mean when you say this? Are you dreaming in the throes of a fever or are you laboring under a madness?"
        "Your astute minds have been completely turned into stinking mushrooms."
        "You are the prostitute of heretics!"
        "I am tired of the pestilent voice of your sirens."
        "You are a bungling magpie, croaking loudly."
        "You forgot to purge yourself with hellabore while you were preparing to fabricate this lie."
        "You are more corrupt than any Babylon or Sodom ever was, and, as far as I can see, are characterized by a completely depraved, hopeless, and notorious godlessness."
        "Your home, once the holiest of all, has become the most licentious den of thieves, the most shameless of all brothels, the kingdom of sin, death, and hell. It is so bad that even Antichrist himself, if he should come, could think of nothing to add to its wickedness."
        "What devilish unchristian thing would you not undertake?"
        "You are an extraordinary creature, being neither God nor man. Perhaps you are the devil himself."
        "Even if the Antichrist appears, what greater evil can he do than what you have done and do daily?"
        "It may be that you want to build yourself a heaven of your own, like those jugglers build themselves out of linen cloth at the Shrove Tuesday carnival. Is it not disgusting that we have to hear such foolish and childish things from you?"
        "In our country, fruit grows on trees and from trees, and meditation upon sin grows from contrition. But in your land, trees may grow on fruits, contrition from sins, people walk on their ears, and everything is upside down."
        "O you wolf in Christendom!"
        "You know less than does a log on the ground."
        "I think that all the devils have at once entered into you."
        "You are worse than all the devils. What you have done, no devil has ever done. Your end is near, you son of perdition and Antichrist! Stop now, you are going to far!"
        "You are the true, chief, and final Antichrist."
        "How far will you go, O devilish pride?"
        "All Christians should be on guard against your antichristian poison."
        "I think you received these ideas in your pipe dreams."
        "You are in all you do the very opposite of Christ as befits a true Antichrist."
        "You are a person of sin and the child of perdition, leading all the world with you to the devil, using your lying and deceitful ways."
        "You are not a pious fraud, but an infernal, diabolical, antichristian fraud."
        "You are the Roman Nimrod and a teacher of sin."
        "It is the old dragon from the abyss of hell who is standing before me!"
        "You hold fast to human dreams and the doctrines of devils."
        "If you who are assembled in a council are so frivolous and irresponsible as to waste time and money on unnecessary questions, when it is the business of a council to deal only with the important and necessary matters, we should not only refuse to obey you, but consider you insane or criminals."
        "Even Lucifer was not guilty of so great a sacrilege in heaven, for he only presumed to be God's equal. God help us!"
        "You condemned the holy gospel and replaced it with the teaching of the dragon from hell."
        "Your words are un-Christian, antichristian, and spoken by the inspiration of the evil spirit."
        "What happened to the house built on sand in Matthew 7 will also happen to you."
        "Must we believe your nightmares?"
        "Look how this great heretic speaks brazenly and sacrilegiously."
        "You run against God with the horns of your pride up in the air and thus plunge into the abyss of hell. Woe unto you, Antichrist!"
        "You are the devil's most dangerous tool!"
        "It seems I must have liars and villains for opponents. I am not worthy in the sight of God that a godly and honorable person should discuss these matters with me in a Christian way. This is my greatest lament."
        "May the Lord Jesus protect me and all devout souls from your contagion and your company!"
        "This venom - the mere smell of which kills a man!"
        "You are a Baal-zebub - that is, a man of flies."
        "You are full of poisonous refuse and insane foolishness."
        "You are ignorant, stupid, godless blasphemers."
        "You moderate enforcer and eulogizer of moderation. You are one of those bloody and deceitful people who affect modesty in words and appearance, but who meanwhile breathe out threats and blood."
        "We leave you to your own devices, for nothing properly suits you except hypocrisy, flattery, and lies."
        "In lying fashion you ignore what even children know."
        "The reward of such flattery is what your crass stupidity deserves. Therefore, we shall turn from you, a sevenfold stupid and blasphemous wise person."
        "People of your sort are hirelings, dumb dogs unable to bark, who see the wolf coming and flee or, rather, join up with the wolf."
        "You are a wolf and apostle of Satan."
        "You are the ultimate scourges of the world, the Antichrist together with your sophists and bishops."
        "You cowardly slave, you corrupt sycophant, with your sickening advice!"
        "You are idiots and swine."
        "Every letter of yours breathes Moabitish pride. So much can a single bull inflate a single bubble that you practically make distinguished asses into gods."
        "You sophistic worms, grasshoppers, locusts, frogs and lice!"
        "You completely close your mind and do nothing but shout, "Anathema, anathema, anathema!" so that by your own voice you are judged mad."
        "Let this generation of vipers prepare itself for unquenchable fire!"
        "You rush forward as an ass under the pelt of a lion."
        "In appearance and words you simulate modesty, but you are so swollen with haughtiness, arrogance, pride, malice, villainy, rashness, superciliousness, ignorance, and stupidity that there is nothing to surpass you."
        "Blind moles!"
        "We despise your whorish impudence."
    )
    messages=( "${array1[@]}" "${array2[@]}" "${array3[@]}" )

    # If CMD_NOT_FOUND_MSGS array is populated use those messages instead of the defaults
    [[ -n ${CMD_NOT_FOUND_MSGS} ]] && messages=( "${CMD_NOT_FOUND_MSGS[@]}" )

    # If CMD_NOT_FOUND_MSGS_APPEND array is populated append those to the existing messages
    [[ -n ${CMD_NOT_FOUND_MSGS_APPEND} ]] && messages+=( "${CMD_NOT_FOUND_MSGS_APPEND[@]}" )

    # Seed RANDOM with an integer of some length
    RANDOM=$(od -vAn -N4 -tu < /dev/urandom)

    # Print a randomly selected message, but only about half the time to annoy the user a
    # little bit less.
    if [[ $((${RANDOM} % 2)) -lt 1 ]]; then
        message=${messages[${RANDOM} % ${#messages[@]}]}
        printf "\n  $(tput bold)$(tput setaf 1)${message}$(tput sgr0)\n\n" >&2
    fi
}

function_exists () {
    # Zsh returns 0 even on non existing functions with -F so use -f
    declare -f $1 > /dev/null
    return $?
}

#
# The idea below is to copy any existing handlers to another function
# name and insert the message in front of the old handler in the
# new handler. By default, neither bash or zsh has has a handler function
# defined, so the default behaviour is replicated.
#
# Also, ensure the handler is only copied once. If we do not ensure this
# the handler would add itself recursively if this file happens to be
# sourced multiple times in the same shell, resulting in a neverending
# stream of messages.
#

#
# Zsh
#
if function_exists command_not_found_handler; then
    if ! function_exists orig_command_not_found_handler; then
        eval "orig_$(declare -f command_not_found_handler)"
    fi
else
    orig_command_not_found_handler () {
        printf "zsh: command not found: %s\n" "$1" >&2
        return 127
    }
fi

command_not_found_handler () {
    print_message
    orig_command_not_found_handler "$@"
}


#
# Bash
#
if function_exists command_not_found_handle; then
    if ! function_exists orig_command_not_found_handle; then
        eval "orig_$(declare -f command_not_found_handle)"
    fi
else
    orig_command_not_found_handle () {
        printf "%s: %s: command not found\n" "$0" "$1" >&2
        return 127
    }
fi

command_not_found_handle () {
    print_message
    orig_command_not_found_handle "$@"
}

#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#
### TO ENABLE P10K
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# alias grep='grep --color=auto --exclude-dir={.bzr, CVS, .git, .hg, .xvn, .idea,.tox} '
