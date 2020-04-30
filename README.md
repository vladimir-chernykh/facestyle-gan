# Hairstyle GAN

The repo contains the code the the model for **detecting and changing the hairstyle** of the person's headshot. It is based on [StarGANv1](https://arxiv.org/pdf/1711.09020.pdf) and [this implementation](https://github.com/yunjey/stargan) in particular.

![results image](results/example.jpg?raw=true)

The model works with **128x128 RGB images** where the face is located in the center of the frame and takes the most part of it. One might do the appropriate crop manually or using any face detection model.

Available features are:
* Black Hair
* Blond Hair
* Brown Hair
* Gray Hair
* Bald
* Bangs
* Receding Hairline
* Straight Hair
* Wavy Hair

# Training

[**CelebA**](http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html) dataset is used for training. I use aligned and cropped version of images. Each image has the size of 178x218 and face in all of them is in the center and of approximately the same size. For more detailed preliminary data anaylsis please look at [`DataExploration`](./notebooks/01_DataExploration.ipynb) notebook.

To train the model I used one NVIDIA K-80 GPU and it took ~48 hours. To repeat the training procedure please run
```bash
./scripts/train.sh
```
It will first download the CelebA dataset and then start the training procedure in the background.
