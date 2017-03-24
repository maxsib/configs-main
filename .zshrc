#!/bin/zsh
autoload -U compinit promptinit
compinit
promptinit
#prompt bigfade
export EDITOR="vim" 
#export TERM="xterm-256color"
export TERM="rxvt-unicode-256color"
#export TERM="termite"
# Для pacman
#[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman
# Корректировка ввода
setopt CORRECT_ALL
# Если в слове есть ошибка, предложить исправить её
SPROMPT="Ошибка! ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "
# Не нужно всегда вводить cd
# просто наберите нужный каталог и окажитесь в нём
setopt autocd
# При совпадении первых букв слова вывести меню выбора
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt correctall

# Aliases
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias -s {avi,mpeg,mkv,mpg,mov,m2v}=mplayer
alias -s {odt,doc,sxw,rtf}=abiword
alias -s {jpg,png}=feh
autoload -U pick-web-browser
alias -s {html,htm}=vivaldi
alias chesscom="chromium --no-sandbox --app=https://www.chess.com/daily"
alias nchesscom="nice -n 12 chromium --no-sandbox --app=https://www.chess.com/daily"
alias blitz="chromium --no-sandbox --app=https://www.chess.com/live"
alias nblitz="nice -n 12 chromium --no-sandbox --app=https://www.chess.com/live"
alias homeserver="chromium --no-sandbox --app=http://maxsib.xyz"
alias pma="chromium --no-sandbox --app=http://pma.my"
alias sync1='sudo emerge --sync'
alias sync2='sudo eix-sync'
alias sync3='sudo emerge -uDNav @world'
alias sync4='sudo emerge -uDNav --with-bdeps=y @world'
alias ram1='echo 1 | sudo tee -a /proc/sys/vm/drop_caches'
alias ram2='echo 2 | sudo tee -a /proc/sys/vm/drop_caches'
alias ram3='echo 3 | sudo tee -a /proc/sys/vm/drop_caches'
alias H='htop'
alias CCD1='sudo CCACHE_DIR="/var/tmp/ccache" ccache -s'
alias CCD2='sudo CCACHE_DIR="/var/tmp/ccache" ccache -C'
alias A='alsamixer'
alias M='mpd --no-daemon'
alias N='ncmpcpp'
alias YD='nice -n 18 ionice -c2 -n6 yandex-disk sync'
# zsh-syntax-highlighting from AUR
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES=(
#        'alias'           'fg=153,bold'
#        'builtin'         'fg=153'
#        'function'        'fg=166'
#        'command'         'fg=153'
#        'precommand'      'fg=153, underline'
#        'hashed-commands' 'fg=153'
#        'path'            'underline'
#        'globbing'        'fg=166'
#)
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="arrow"
#ZSH_THEME="sorin"
#ZSH_THEME="fishy"
#ZSH_THEME="af-magic"
#ZSH_THEME="bira"
#ZSH_THEME="darkblood"
#ZSH_THEME="fox"
#ZSH_THEME="nicoulaj"
#ZSH_THEME="obraun"
#ZSH_THEME="philips"
#ZSH_THEME="pure"
#ZSH_THEME="risto"
#ZSH_THEME="simple"
#ZSH_THEME="sunaku"
#ZSH_THEME="sunrise"
#ZSH_THEME="zhann"
#ZSH_THEME="avit"
#ZSH_THEME="lukerandall"
#ZSH_THEME="juanghurtado"
#ZSH_THEME="jonathan"
#ZSH_THEME="intheloop"
#ZSH_THEME="gnzh"
#ZSH_THEME="gentoo"
#ZSH_THEME="gallifrey"
source $ZSH/oh-my-zsh.sh
. /usr/share/zsh/site-contrib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
screenfetch
hello
