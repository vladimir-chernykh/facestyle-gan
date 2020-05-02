#!/bin/bash

FACE_PART=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"/../stargan || exit

if [ ! -d "./data/celeba" ]; then
  chmod +x download.sh
  ./download.sh celeba
fi

if [ "$FACE_PART" = "hair" ]; then
  nohup python main.py \
     --mode train \
     --dataset CelebA \
     --image_size 128 \
     --c_dim 9 \
     --sample_dir stargan_celeba_hair/samples \
     --log_dir stargan_celeba_hair/logs \
     --model_save_dir stargan_celeba_hair/models \
     --result_dir stargan_celeba_hair/results \
     --selected_attrs Black_Hair Blond_Hair Brown_Hair Gray_Hair Bald Bangs Receding_Hairline Straight_Hair Wavy_Hair \
     &
elif [ "$FACE_PART" = "mouth" ]; then
  nohup python main.py \
     --mode train \
     --dataset CelebA \
     --image_size 128 \
     --c_dim 2 \
     --sample_dir stargan_celeba_mouth/samples \
     --log_dir stargan_celeba_mouth/logs \
     --model_save_dir stargan_celeba_mouth/models \
     --result_dir stargan_celeba_mouth/results \
     --selected_attrs Mouth_Slightly_Open Smiling \
     &
elif [ "$FACE_PART" = "eyes" ]; then
  nohup python main.py \
     --mode train \
     --dataset CelebA \
     --image_size 128 \
     --c_dim 5 \
     --sample_dir stargan_celeba_eyes/samples \
     --log_dir stargan_celeba_eyes/logs \
     --model_save_dir stargan_celeba_eyes/models \
     --result_dir stargan_celeba_eyes/results \
     --selected_attrs Arched_Eyebrows Bushy_Eyebrows Bags_Under_Eyes Eyeglasses Narrow_Eyes \
     &
elif [ "$FACE_PART" = "nose" ]; then
  nohup python main.py \
     --mode train \
     --dataset CelebA \
     --image_size 128 \
     --c_dim 2 \
     --sample_dir stargan_celeba_mouth/samples \
     --log_dir stargan_celeba_mouth/logs \
     --model_save_dir stargan_celeba_mouth/models \
     --result_dir stargan_celeba_mouth/results \
     --selected_attrs Big_Nose Pointy_Nose \
     &
else
  echo "Please use one of the supported face parts!" && exit
fi
