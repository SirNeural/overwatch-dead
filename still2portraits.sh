#!/bin/bash

# this is meant to be used with xargs for batch mode
# usage example: still2portraits.sh still0013.png still0013
# with xargs: ls | xargs -I file ../still2portraits.sh file file

# 480 values
#CROP_X_STARTS=(15 53 90 127 164 202 404 442 479 517 554 591)
#CROP_X_SIZE=34
#CROP_Y_START=18
#CROP_Y_SIZE=11

# 720 values
CROP_X_STARTS=(52 127 202 276 351 426 831 906 980 1055 1130 1204)
CROP_X_SIZE=24
CROP_Y_START=36
# Y start might have been changed in a patch around 7/19
# CROP_Y_START=30
CROP_Y_SIZE=24

CONVERT=$(which convert)

for NUM in $(seq 0 11); do
    CROP_X_START=${CROP_X_STARTS[$NUM]}
    OUT_FILENAME=${NUM}_${2}.png
    $CONVERT $1 -crop ${CROP_X_SIZE}x${CROP_Y_SIZE}+${CROP_X_START}+${CROP_Y_START} +repage $OUT_FILENAME
done