#!/usr/bin/env zsh

osascript  <<EOF
    display notification "$(pbpaste)" with title "MPV"
EOF

# export http_proxy=http://127.0.0.1:41091
# export all_proxy=socks5://127.0.0.1:1090

# alias yget='~/you-get/you-get'
# alias pyget='~/you-get/you-get -x socks5:127.0.0.1:1090'

# alias ytdl="youtube-dl"
# alias pytdl="youtube-dl --proxy http://127.0.0.1:41091 --external-downloader aria2c --external-downloader-args '-x 16'"


# osascript -e 'display notification \"$text\" with title "MPV" '
# text=`pytdl --get-title $(pbpaste)`
# filename=`pytdl --get-filename $(pbpaste)`
# osascript  <<EOF
#     display notification "$filename" with title "$text"
# EOF

mpv $(pbpaste)
# mpv --ytdl-raw-options=proxy="[socks5://127.0.0.1:1090]" $(pbpaste)
# mpv --ytdl-raw-options-append=proxy="socks5://127.0.0.1:1090" $(pbpaste)
# mpv --ytdl-raw-options=proxy="[socks5://127.0.0.1:1090]" --ytdl-raw-options-append=proxy="socks5://127.0.0.1:1090" $(pbpaste)

# pytdl -o - "https://www.youtube.com/watch?v=BaW_jenozKcj" | mpv -
# pyget -p mpv $(pbpaste)
