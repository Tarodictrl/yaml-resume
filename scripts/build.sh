#!/bin/bash
set -e

SCRIPT_DIR=$(readlink -f $(dirname $BASH_SOURCE))
ROOT_DIR=$(readlink -f "$SCRIPT_DIR/..")
BUILD_PATH=$(echo "$ROOT_DIR/$BUILD_PATH" | tr -d '\r')

source $ROOT_DIR/.env

echo "Building yamlcv"
$SCRIPT_DIR/generate_cv.sh

CV_YAML=$(echo "$BUILD_PATH/$CV.yaml" | tr -d '\r')
CV_HTML=$(echo "$BUILD_PATH/$CV.html" | tr -d '\r')
CV_PDF=$(echo "$BUILD_PATH/$CV.pdf" | tr -d '\r')

echo "Building HTML from $CV_YAML"
yaml-cv yaml-cv $CV_YAML > $CV_HTML

echo "Building PDF from $CV"
yaml-cv yaml-cv $CV_YAML --pdf $CV_PDF

echo "Check files in ./$BUILD_PATH directory"