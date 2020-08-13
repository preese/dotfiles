# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/preese/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %F{12}%n@%F{12}%m %B%F{13}%~%f%b %# '
# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

#added after reading user guide

alias config="vi $HOME/.zshrc"
alias reload="source $HOME/.zshrc"

# Zsh settings for history
setopt HIST_VERIFY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt CORRECT

# nf [-NUM] [COMMENTARY...] -- never forget last N commands
nf() {
  local n=-1
  [[ "$1" = -<-> ]] && n=$1 && shift
  fc -lnt ": %Y-%m-%d %H:%M ${*/\%/%%} ;" $n | tee -a .neverforget
}

# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# Don’t nice background processes
setopt NO_BG_NICE

# Commas in ls, du, df output
export BLOCK_SIZE="'1"

# Play safe!
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'

# Typing errors...
alias 'cd..= cd ..'

## added for yadm options
sourceZsh(){
    source ~/.zshrc
    backupToDrive ~/.zshrc
    echo "New .zshrc sourced."
}
editZsh(){
    updateYadm
    vim ~/.zshrc
    source ~/.zshrc
    backupToDrive ~/.zshrc
    echo "New .zshrc sourced."
}
updateYadm() {
    yadm pull
}
backupToDrive(){
    yadm add ~/.zshrc
    yadm commit -m "updated .zshrc"
    yadm push
    echo "New .zshrc backed up to yadm."
}
