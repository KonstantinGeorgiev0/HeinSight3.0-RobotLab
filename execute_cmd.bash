#!/usr/bin/env bash
# command.bash

set -euo pipefail

# default values
NMS_IOU=0.1
CONF=0.2
BATCH=64
CREATE_PLOTS=false

usage() {
  echo "Usage: $0 -i <input_image_path> [-n nms_iou] [-c conf] [-b batch_size] [-p]"
  echo "  -i  Path to input image (required)"
  echo "  -n  NMS IOU (default: $NMS_IOU)"
  echo "  -c  Confidence threshold (default: $CONF)"
  echo "  -b  Batch size (default: $BATCH)"
  echo "  -p  Enable --create_plots flag"
  exit 1
}

# parse flags
while getopts ":i:n:c:b:ph" opt; do
  case $opt in
    i) INPUT_IMAGE_PATH="$OPTARG" ;;
    n) NMS_IOU="$OPTARG" ;;
    c) CONF="$OPTARG" ;;
    b) BATCH="$OPTARG" ;;
    p) CREATE_PLOTS=true ;;
    h|\?) usage ;;
  esac
done

# check required
if [ -z "${INPUT_IMAGE_PATH-}" ]; then
  echo "Error: input_image_path is required."
  usage
fi

# assemble command
CMD=( python3 main.py
  --input_image_path "$INPUT_IMAGE_PATH"
  --nms_iou "$NMS_IOU"
  --conf "$CONF"
  --batch_size "$BATCH"
)
$CREATE_PLOTS && CMD+=( --create_plots )

# run it
"${CMD[@]}"

