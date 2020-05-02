#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

MODEL_DIR=$DIR/../models/celeba_128_eyes
ZIP_FILE=$MODEL_DIR/model.zip
URL="https://www.dropbox.com/s/5vtpdzeaxmb7lbp/celeba_128_eyes.zip?dl=0"
mkdir -p "$MODEL_DIR"
wget -N "$URL" -O "$ZIP_FILE"
unzip "$ZIP_FILE" -d "$MODEL_DIR"
rm "$ZIP_FILE"

MODEL_DIR=$DIR/../models/celeba_128_nose
ZIP_FILE=$MODEL_DIR/model.zip
URL="https://www.dropbox.com/s/2zfrbt6kxmnxjtq/celeba_128_nose.zip?dl=0"
mkdir -p "$MODEL_DIR"
wget -N "$URL" -O "$ZIP_FILE"
unzip "$ZIP_FILE" -d "$MODEL_DIR"
rm "$ZIP_FILE"

MODEL_DIR=$DIR/../models/celeba_128_mouth
ZIP_FILE=$MODEL_DIR/model.zip
URL="https://www.dropbox.com/s/c3tue3udenhtkkx/celeba_128_mouth.zip?dl=0"
mkdir -p "$MODEL_DIR"
wget -N "$URL" -O "$ZIP_FILE"
unzip "$ZIP_FILE" -d "$MODEL_DIR"
rm "$ZIP_FILE"

MODEL_DIR=$DIR/../models/celeba_128_hair
ZIP_FILE=$MODEL_DIR/model.zip
URL="https://www.dropbox.com/s/it748il7f6mgxk9/celeba_128_hair.zip?dl=0"
mkdir -p "$MODEL_DIR"
wget -N "$URL" -O "$ZIP_FILE"
unzip "$ZIP_FILE" -d "$MODEL_DIR"
rm "$ZIP_FILE"
