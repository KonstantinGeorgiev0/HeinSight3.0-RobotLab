# HeinSight3.0



code and models: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11053915.svg)](https://doi.org/10.5281/zenodo.11053915)

dataset: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11053823.svg)](https://doi.org/10.5281/zenodo.11053823)

## Installation
Clone `yolov5`
```
git clone https://github.com/KonstantinGeorgiev0/yolov5.git
```
Install python packages via commands:
```
conda create -n hte python=3.9
conda activate hte
cd yolov5
pip3 install -r requirements.txt
cd ..
pip3 install -r requirements.txt
```

## Usage (vial then liquid):
Place image in ./data/test_images1
Then from root run:
```
python3 yolov5/vial_crop_liquid.py \
  --source data/test_images1/<image_file> \
  --vial-weights vial/best.pt \
  --vial-conf <min_confidence> --vial-iou <min_intersection_over_union> --imgsz <img_size> \
  --pad <padding_around_image> --crop-h 640 \
  --liquid-task detect \
  --liquid-weights liquid/best_renamed.pt \
  --liquid-imgsz <img_size> --liquid-conf <min_confidence> --liquid-iou <min_iou> \
  --outdir runs/<output_directory>
```
Example:
```
python3 yolov5/vial_crop_liquid.py \
  --source data/test_images1/Day_1_12w%_Proglyde_DMM.jpeg \
  --vial-weights vial/best.pt \
  --vial-conf 0.65 --vial-iou 0.45 --imgsz 640 \
  --pad 0.12 --crop-h 640 \
  --liquid-task detect \
  --liquid-weights liquid/best_renamed.pt \
  --liquid-imgsz 640 --liquid-conf 0.65 --liquid-iou 0.50 \
  --outdir runs/vial2liquid/
```

## Usage (images/videos):
Place the image/video in ./data/test_images.
Then from root run
```
python3 main.py --input_image_path <path of video> --nms_iou 0.1 --conf 0.2 --batch_size 64 --create_plots

```
Example
```
python3 main.py --input_image_path ./data/test_images/hetro_homo_cap_flash.mp4 --nms_iou 0.1 --conf 0.2 --batch_size 64 --create_plots
```

## Usage (vials & liquids in images/videos):
Place the image/video in ./data/test_images.
Then from root run
```
python3 yolov5/detect.py \
  --weights <liquid OR vial>/best.pt \
  --img <img size> \
  --conf <set minimum confidence> \
  --source data/<img file>
```
Example
```
python3 yolov5/detect.py \
  --weights liquid/best.pt \
  --img 640 \
  --conf 0.65 \
  --source data/copy_6493_5wt_dmm_9day_RT.jpeg
```

## Usage (camera):
From root run
```
python3 main.py --use_cameras <num_cameras> --nms_iou 0.1 --conf 0.2 --batch_size 64 --create_plots
```
<num_cameras> represents the number of cameras that you want to analyze

Example
If you want to analyze 2 cameras
```
python3 main.py --use_cameras 2 --nms_iou 0.1 --conf 0.2 --batch_size 64 --create_plots
```
To finish camera detections gracefully, press and hold the esc key to stop the analysis


## Publication:
https://chemrxiv.org/engage/chemrxiv/article-details/65e5481f9138d231619c1879
