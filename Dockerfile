FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime

MAINTAINER Vladimir Chernykh <vladimir.chernykh@phystech.com>

RUN apt-get update && \
    apt-get install -y \
        wget \
        zip \
        htop

RUN pip install tensorflow==1.14.0

RUN pip install matplotlib==3.2.1 \
		pandas==1.0.3

RUN pip install coremltools==3.3 \
                onnx_coreml==1.2 \
                onnx==1.5.0

RUN pip install jupyter

CMD bash -c "jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root --notebook-dir='/workspace' --NotebookApp.token=''"
