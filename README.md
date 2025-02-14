# Facestyle GAN

The repo contains the code the the model for **detecting and changing face parts style** of the person's headshot.

**When cloning the repo please uses `--recursive` tag to clone all the sobmodules as well.**

# Algorithm

The algorithm is based on [StarGANv1](https://arxiv.org/pdf/1711.09020.pdf) and [this implementation](https://github.com/yunjey/stargan) in particular.

The model works with **128x128 RGB images** where the face is located in the center of the frame and takes the most part of it. One might do the appropriate crop manually or using any face detection model.

![results image](results/example.jpg?raw=true)

4 face parts are supported and each has its own available features:
* **Mouth**
  * Mouth Slightly Open
  * Smiling
* **Eyes**
  * Arched Eyebrows
  * Bushy Eyebrows
  * Bags Under Eyes
  * Eyeglasses
  * Narrow Eyes
* **Nose**
  * Big Nose
  * Pointy Nose
* **Hair**
  * Black Hair
  * Blond Hair
  * Brown Hair
  * Gray Hair
  * Bald
  * Bangs
  * Receding Hairline
  * Straight Hair
  * Wavy Hair

Note that each face part is modified with its own separate model.

# Environment

All the training/inference/notebooks are recommended to be run using the provided **Docker** image ([`Dockerfile`](./Dockerfile)). For more info on how to install and use Docker see the [official docs](https://docs.docker.com). To build the Docker image from this repo execute:
```bash
docker build -f Dockerfile -t hairstyle .
```
To run the container:
```bash
docker run -d -p 8888:8888 -v /YOUR/PATH/TO/REPO:/workspace hairstyle
```
By default the container is launched with the Jupyter notebook running at port 8888.

Note that the all the code supports **GPU** computations and Docker container should be [launched correspondingly](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(Native-GPU-Support)) to be able to benefit from it.

# Training

[**CelebA**](http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html) dataset is used for training. Aligned and cropped version of images are used. Each image has the size of 178x218 and the face is located in the center of the frame. All the faces have approximately the same size. For more detailed preliminary data anaylsis please look at [`DataExploration`](./notebooks/00_DataExploration.ipynb) notebook.

To train the model I used one NVIDIA **K-80 GPU** and it took ~48 hours. To repeat the training procedure please run the following script (the name of the face part might be one of the `eyes`, `mouth`, `nose`, `hair`):
```bash
./scripts/train.sh eyes
```
It will first download the CelebA dataset and then start the training procedure in the background. The progress is tracked and saved in the format of **Tensorboard logs**.

I highly recommend running the training procedure using the provided Docker image.

Below is the training curves for the Generator part of the network for all 4 models.

![training curves](results/loss_curves.jpg?raw=true)

The full training tensorboard logs for each of the models can be found in `logs` subfolder of the corresponding folder inside [`results`](./results) directory.

**TRAINING EVOLUTION VIDEOS ARE AVAILABLE**:
* [Mouth](https://www.dropbox.com/s/ti3ck7cdul4gnah/evolution.mp4?dl=0)
* [Eyes](https://www.dropbox.com/s/3b24tmk5kajqw6o/evolution.mp4?dl=0)
* [Nose](https://www.dropbox.com/s/zzgxyov8kqfvrp0/evolution.mp4?dl=0)
* [Hair](https://www.dropbox.com/s/qlla0ybwe5h4wbu/evolution.mp4?dl=0)

# Inference

To run the trained model one should first **download** it. To do so please execute:
```bash
./scripts/get_models.sh
```
It will download model weights for both **generator and discriminator** parts of the model.

After that feel free to play with the all the Inference notebooks from [`notebooks`](./notebooks) folder to see how the **inference** should be done on the trained models and what are the capabilities of the models.

Below are the links to the image grids with inference examples for each of the models. Each columns corresponds to one of the styles applied (first column is the original image):
* [Mouth](./results/celeba_128_mouth/grid.jpg)
* [Eyes](./results/celeba_128_eyes/grid.jpg)
* [Nose](./results/celeba_128_nose/grid.jpg)
* [Hair](./results/celeba_128_hair/grid.jpg)

# Convert to Mobile iOS

I also provide a code to convert the trained model to the Apple Machine Learning models format **mlmodel**. It allows to run the model on all Apple devices running one of the following systems: iOS, OSX, watchOS, tvOS. It includes **iPhone** and Macbook.

[`ConversionToMobileIOS`](./notebooks/20_ConversionToMobileIOS.ipynb) shows how the models are converted. Please note that the inference via *mlmodel* format (which is the part of the notebook) is possible only on Mac laptops/desktops.
