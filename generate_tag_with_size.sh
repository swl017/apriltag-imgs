#!/bin/bash
# Usage: Put this file in apriltag-imgs folder and execute
FOLDER="tag16h5"
FILE_NAME="tag16_05_"
SIZE="1250" # mm
LAST_NUM=29

list=$(seq 0 $LAST_NUM)
for i in $list
do
    echo $i
    if [[ "$i" -lt 10 ]]; then
        num="0000""$i"
    elif [[ "$i" -lt 100 ]]; then
        num="000""$i"
    else
        echo "Error: Case Exceeded"
        break
    fi
    python3 tag_to_svg.py ${FOLDER}/${FILE_NAME}${num}.png ${FOLDER}/${FILE_NAME}${num}_${SIZE}.svg --size=${SIZE}mm
done