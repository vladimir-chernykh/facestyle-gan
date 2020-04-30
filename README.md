# Hairstyle GAN

The repo contains the code the the model for **detecting and changing the hairstyle** of the person's headshot. It is based on [StarGANv1](https://arxiv.org/pdf/1711.09020.pdf) and [this implementation](https://github.com/yunjey/stargan) in particular.

![results image](data/result.jpg?raw=true)

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
