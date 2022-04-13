#!/usr/bin/env zsh

# osascript -e 'display notification \"$text\" with title "MPV" '
text=`pytdl --get-title $(pbpaste)`
filename=`pytdl --get-filename $(pbpaste)`
osascript  <<EOF
    display notification "$(filename)" with title "$(pbpaste)"
EOF



#export http_proxy=http://127.0.0.1:41091

# alias yget='~/you-get/you-get'
# alias pyget='~/you-get/you-get -x 127.0.0.1:41091'

# alias ytdl="youtube-dl"
# alias pytdl="youtube-dl --proxy http://127.0.0.1:41091 --external-downloader aria2c --external-downloader-args '-x 16'"

mpv $(pbpaste)
# yget -p mpv $(pbpaste)

# pytdl -o - "https://www.youtube.com/watch?v=BaW_jenozKcj" | mpv -
