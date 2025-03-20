# BEVFusion-TensorRT-ROS
This repository contains sources and model for BEVFusion inference using TensorRT.

## Environments
To build the bevfusion inference, TensorRT, ROS and CUDA are needed. Our project supports both x86 and arm architectures, and relevant code need to be modified in the CMakeList before compiling.
 - ubuntu-20.04
 - cuda-11.3
 - cudnn-8.6.0
 - TensorRT-8.5

## Model

Download onnx files from [BaiduCloud](https://pan.baidu.com/s/1eUE_nTY3cMbcJBLVpPPErA?pwd=2580) and place to ```./src/object_detection/model/resnet50int8/```.

## Compile and Run
```
mkdir bevfusion_ws && cd bevfusion_ws
git clone https://github.com/cn-hezhu/BEVFusion-TensorRT-ROS.git
catkin_make
source devel/setup.bash
roslaunch bevfusion bevfusion_node.launch

```

# References

+ [bevfusion](https://github.com/mit-han-lab/bevfusion)
+ [Lidar_AI_Solution](https://github.com/NVIDIA-AI-IOT/Lidar_AI_Solution)
