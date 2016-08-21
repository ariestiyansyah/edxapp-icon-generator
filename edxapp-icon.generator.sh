#!/bin/bash

set -e

SOURCE_FILE="$1"
TARGET_DIR="$2"

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

# Generate icon

info 'Generate Icon-29.png ...'
convert "$SOURCE_FILE" -resize 29x29 "$TARGET_DIR/Icon-29.png"
info 'Generate Icon-29@2x.png ...'
convert "$SOURCE_FILE" -resize 58x58 "$TARGET_DIR/Icon-29@2x.png"

info 'Icon is ready Darth edXius!.'
