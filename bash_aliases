#!/bin/bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias config='/usr/bin/git --git-dir=/home/andy/.cfg/ --work-tree=/home/andy'
alias b='bundle exec'
alias yv='googler -w youtube.com --url-handler mpv $argv'
alias so='googler -j -w stackoverflow.com'
alias apiconsole='b bin/console --no-plugins'
alias dmenu='dmenu -b -i -l 10 -p : -fn 'Ttyp0-14' -nb \#101012 -sb \#66AABB -sf \#101012'
alias gco='git checkout $(git branch | ag -v ^\\* | fzf)'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias mutt='neomutt'
alias vim='nvim'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
