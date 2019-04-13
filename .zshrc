#!/bin/zsh
PATH=/usr/local/sbin:/usr/sbin:/sbin$PATH
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
alias -s {html,htm}=opera
alias chesscom="chromium-browser --app=https://www.chess.com/daily"
alias nlichess="nice -n 13 chromium-browser --no-sandbox --app=https://ru.lichess.org"
alias nchesscom="nice -n 13 chromium-browser --no-sandbox --app=https://www.chess.com"
#alias chesscom="chromium-dev --app=https://www.chess.com/daily"
alias blitz="chromium-browser --app=https://www.chess.com/live"
alias nblitz="nice -n 13 chromium-browser --no-sandbox --app=https://www.chess.com/live"
alias 2nblitz="nice -n 13 chromium-browser-dev --no-sandbox --app=https://www.chess.com/live"
alias hserver="nice -n 13 chromium-browser --no-sandbox --app=http://maxsib26874.xyz"
alias nfire="nice -n 14 firefox"
alias pma="nice -n 13 chromium-browser --no-sandbox --app=http://pma.my"
#alias blitz="chromium-dev --app=https://www.chess.com/live"
alias ram1='echo 1 | sudo tee -a /proc/sys/vm/drop_caches'
alias ram2='echo 2 | sudo tee -a /proc/sys/vm/drop_caches'
alias ram3='echo 3 | sudo tee -a /proc/sys/vm/drop_caches'
alias M='mpd --no-daemon'
alias N='ncmpcpp'
alias H='htop'
alias X='xset m 2 1 &'
alias A='alsamixer'
alias W='watch sensors'
alias T='tty-clock -B -C4 -c'
#alias YD='nice -n 17 ionice -c2 -n5 yandex-disk start && yandex-disk sync'
alias YD='nice -n 17 ionice -c2 -n5 yandex-disk sync'
alias bth='bluetoothctl'
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
#ZSH_THEME="arrow"
#ZSH_THEME="agnoster"
#ZSH_THEME="sorin"
#ZSH_THEME="fishy"
ZSH_THEME="af-magic"
#ZSH_THEME="bira"
#ZSH_THEME="darkblood"
#ZSH_THEME="fox"
source $ZSH/oh-my-zsh.sh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
screenfetch
#hello
