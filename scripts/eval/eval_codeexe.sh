#!/bin/bash

###################################################################################
# Hardware: 1x A6000 48GB GPU, or any other GPUs with at least 48GB memory
# Note: We use the default hyperparameters provided by the corresponding benchmark.
# To reproduce the results reported in the paper, do not change it.
###################################################################################

export CUDA_VISIBLE_DEVICES=0
OUTPUT_DIR=output
for MODEL_PATH in semcoder/semcoder_1030 semcoder/semcoder_s_1030
do
    MODEL_NAME=$(basename $MODEL_PATH)
    OUTPUT_SAVE_PATH="${OUTPUT_DIR}/${MODEL_NAME}/run${RUN}"
    mkdir -p $OUTPUT_SAVE_PATH

    python -m lcb_runner.runner.main \
        --model $MODEL_PATH \
        --scenario codeexecution \
        --cot_code_execution \
        --n 1 \
        --stop "[/ANSWER]" \
        --output_dir $OUTPUT_SAVE_PATH \
        --evaluate

done
