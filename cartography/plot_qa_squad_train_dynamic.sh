#!/bin/bash

PATH_TO_MODEL_OUTPUT_DIR_WITH_TRAINING_DYNAMICS="../eval_output/electra_small_squad/fine-tune/SQuAD/"
TASK="SQuAD"
MODEL_NAME="ELECTRA_small"

export PYTHONPATH=${PWD}
echo ${PYTHONPATH}

python selection/train_dy_filtering.py \
    --plot \
    --task_name ${TASK} \
    --model_dir ${PATH_TO_MODEL_OUTPUT_DIR_WITH_TRAINING_DYNAMICS} \
    --model ${MODEL_NAME} \
