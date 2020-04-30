#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

MODEL_DIR=$DIR/../models/celeba_128_custom
ZIP_FILE=$MODEL_DIR/model.zip
URL="https://www.dropbox.com/s/prlyvysidntkyk4/celeba-128x128-9attrs.zip?dl=0"
mkdir -p "$MODEL_DIR"
wget -N "$URL" -O "$ZIP_FILE"
unzip "$ZIP_FILE" -d "$MODEL_DIR"
rm "$ZIP_FILE"