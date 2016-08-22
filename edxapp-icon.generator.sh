#!/bin/bash

set -e

SOURCE_FILE="$1"
TARGET_DIR="$2"

edXius () {
     local blue="\033[1;34m"
     local normal="\033[0m"
     echo -e "[${blue}edXius${normal}] $1"
}

run() {
cat << EOF
USAGE:
    $0 SOURCEFILE TARGETDIR
EOF
}

# Check if ImageMagick installed, if not then brew install ImageMagick
command -v convert >/dev/null 2>&1 && {
    echo "Tools are ready...."
} || {
    echo "Installing ImageMagick"
    brew install ImageMagick
}

# Check parameter
if [ $# != 2 ];then
    run
    exit -1
fi

# Check Target directory, if not mkdir
if [ ! -d "$TARGET_DIR" ];then
    mkdir -p "$TARGET_DIR"
fi

edXius 'Generate iTunesArtwork.png...'
convert "$SOURCE_FILE" -resize 512x512 "$TARGET_DIR/iTunesArtwork.png"
edXius 'Generate iTunesArtwork@2x.png ...'
convert "$SOURCE_FILE" -resize 1024x1024 "$TARGET_DIR/iTunesArtwork@2x.png"

edXius 'Generate Icon-29.png ...'
convert "$SOURCE_FILE" -resize 29x29 "$TARGET_DIR/Icon-29.png"
edXius 'Generate Icon-29@2x.png ...'
convert "$SOURCE_FILE" -resize 58x58 "$TARGET_DIR/Icon-29@2x.png"
edXius 'Generate Icon-29@3x.png ...'
convert "$SOURCE_FILE" -resize 87x87 "$TARGET_DIR/Icon-29@3x.png"

edXius 'Generate Icon-40.png ...'
convert "$SOURCE_FILE" -resize 40x40 "$TARGET_DIR/Icon-40.png"
edXius 'Generate Icon-40@2x.png ...'
convert "$SOURCE_FILE" -resize 80x80 "$TARGET_DIR/Icon-40@2x.png"
edXius 'Generate Icon-40@3x.png ...'
convert "$SOURCE_FILE" -resize 120x120 "$TARGET_DIR/Icon-40@3x.png"

edXius 'Generate Icon-60.png ...'
convert "$SOURCE_FILE" -resize 60x60 "$TARGET_DIR/Icon-60.png"
edXius 'Generate Icon-60@2x.png ...'
convert "$SOURCE_FILE" -resize 120x120 "$TARGET_DIR/Icon-60@2x.png"
edXius 'Generate Icon-60@3x.png ...'
convert "$SOURCE_FILE" -resize 180x180 "$TARGET_DIR/Icon-60@3x.png"

edXius 'Icon is ready Darth edXius'
