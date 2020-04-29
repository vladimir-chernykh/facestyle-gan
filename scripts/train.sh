#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"/../stargan || exit

if [ ! -d "./data/celeba" ]; then
  chmod +x download.sh
  ./download.sh celeba
fi

nohup python main.py \
     --mode train \
     --dataset CelebA \
     --image_size 128 \
     --c_dim 9 \
     --sample_dir stargan_celeba/samples \
     --log_dir stargan_celeba/logs \
     --model_save_dir stargan_celeba/models \
     --result_dir stargan_celeba/results \
     --selected_attrs Black_Hair Blond_Hair Brown_Hair Gray_Hair Bald Bangs Receding_Hairline Straight_Hair Wavy_Hair \
     &