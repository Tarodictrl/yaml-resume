#!/bin/bash
set -e

SCRIPT_DIR=$(readlink -f $(dirname $BASH_SOURCE))
ROOT_DIR=$(readlink -f "$SCRIPT_DIR/..")

source $ROOT_DIR/.env
SRC_PATH=$(echo "$ROOT_DIR/$SRC_PATH" | tr -d '\r')
BUILD_PATH=$(echo "$ROOT_DIR/$BUILD_PATH" | tr -d '\r')

mkdir -p $BUILD_PATH

SKILLS="${SRC_PATH}/skills.yaml"
YAMLCV="${SRC_PATH}/yamlcv.yaml"
CV_YAML="${BUILD_PATH}/${CV}.yaml"
rm -vf $BUILD_PATH/* 2>/dev/null
echo 'copy template'
cp -v $YAMLCV $CV_YAML
IFS=$'\n'
CATEGORIES=$(yq '.. comments="" | explode(.) | .categories[]' $SKILLS)

for CATEGORY in $CATEGORIES; do
   export CATEGORY
   export ITEMS=$(yq '.. comments="" | explode(.) | .skills[] | select(.category == env(CATEGORY)) | .name as $item ireduce ([]; . + $item) | join(",") ' $SKILLS | uniq)
   echo "updating '$CATEGORY' items in $CV_YAML"
   yq -i '.technical += {"category": env(CATEGORY), "items": env(ITEMS)}' $CV_YAML
done

echo "Successfully built $CV_YAML"