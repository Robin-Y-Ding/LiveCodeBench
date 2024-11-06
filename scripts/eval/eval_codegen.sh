export CUDA_VISIBLE_DEVICES=0;
OUTPUT_DIR=output
MODEL_PATH=semcoder/semcoder_1030 # semcoder/semcoder_s_1030
MODEL_NAME=$(basename $MODEL_PATH)
OUTPUT_SAVE_PATH="${OUTPUT_DIR}/${MODEL_NAME}"
mkdir -p $OUTPUT_SAVE_PATH

python -m lcb_runner.runner.main \
    --model $MODEL_PATH \
    --scenario codegeneration \
    --stop "<｜end▁of▁sentence｜>" \
    --output_dir $OUTPUT_SAVE_PATH \
    --evaluate
