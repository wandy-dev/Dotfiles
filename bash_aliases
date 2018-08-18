#!/bin/bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias config='/usr/bin/git --git-dir=/home/andy/.cfg/ --work-tree=/home/andy'
alias b='bundle exec'
alias apiconsole='b bin/console --no-plugins'
alias dmenu='dmenu -b -i -l 10 -p : -fn 'Ttyp0-14' -nb \#101012 -sb \#66AABB -sf \#101012'
alias gco='git checkout $(git branch | ag -v ^\\* | fzf)'
