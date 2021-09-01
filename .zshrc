#!/bin/zsh
# -------------------------------------------------
#
#       James" Excellent Zsh Profile
#
#           Written: James Varoutsos 
#   Date: 7-Aug-2021        Version: 1.1
#
#   1.0 - Initial
#   1.1 - Created PS1 logic + added powerlevel10k support
#
# ------------------------------------------------- 

unset PS1       # To enable safe-swapping between shells
unset P10K_PATH # Fixes edge-case where powerline10k dir gets scrubbed

# Set pre-program aliases
if [ -f /usr/bin/python3 ]; then
    alias python="python3"
    alias py="python3"
fi

# Display current terminal colors
function showColors {
    for i in {0..255}; do 
        print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'};
    done
}

# Check if powerlevel10k is cloned anywhere
if [[ -d "$HOME/powerlevel10k" ]]; then
    P10K_PATH="$HOME/powerlevel10k"
elif [[ -d /etc/pureline ]]; then
    P10K_PATH="/etc/powerlevel10k"
else
    autoload -U colors && colors
    # Set terminal PS1
    if [[ $(id -u) = 0 ]]; then
        export PS1="[%d]%F{9}%n%F{8}@%F{12}%M%F{8}#%f"
    else
        export PS1="[%d]%F{11}%n%F{8}@%F{12}%M%F{8}$%f"
    fi
fi

# Set autocompletion options
zstyle ':completion:*' completer _complete _ignored _correct
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/vjmes/.zshrc'

autoload -Uz compinit
compinit

# For anything that isn't linux term & if powerlevel10k has been found
if [ "$TERM" != "linux" ] && [[ -n "${P10K_PATH+x}" ]]; then 
    # Use pureline to set PS1 if it exists
    if [ -f ~/.p10k.zsh ]; then
        source ~/powerlevel10k/powerlevel10k.zsh-theme
        source ~/.p10k.zsh
    else
        # Load some defaults?
    fi
fi

# Zsh history set-up
export HISTFILE="$HOME/.zhistory.log"
export HISTORY_IGNORE="history:pwd"
export HISTTIMEFORMAT="%h %d %H:%M:%S -- "
export HISTSIZE=10000
export SAVEHIST=100000
setopt APPENDHISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# Standard aliases
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias lsj="ls -lathr --color=auto"
alias grep="grep --color=auto"
alias dfj="df -h"
alias hist="history 0"
alias ghist="history 0 | grep --color=auto"

# Add cool stuff to $PATH
export PATH=/home/vjmes/.local/bin:$PATH

# Set grep match color
export GREP_COLORS='mt=49;38;5;120:ln=49;38;5;75'

# Set ls colors
export LS_COLORS='rs=0:di=36;1:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=38;5:sg=38;5:ca=38;5:tw=38;5:ow=38;5:st=38;5:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
