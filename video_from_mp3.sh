#!/bin/sh
# 音声から動画ファイルを作成する
# see https://dev.classmethod.jp/articles/ffmpeg-create-movie-by-audio/
# 使い方: video_from_mp3.sh foo.mp3 bar.png
set -eux
INPUT_AUDIO=$1
INPUT_PICTURE=$2
ffmpeg \
    -loop 1 \
    -r 30000/1001 \
    -i $INPUT_PICTURE -i $INPUT_AUDIO \
    -vcodec libx264 \
    -acodec aac -strict experimental -ab 320k -ac 2 -ar 48000 \
    -pix_fmt yuv420p \
    -shortest \
    $INPUT_AUDIO.mp4
