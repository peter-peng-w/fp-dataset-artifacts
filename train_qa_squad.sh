#!/bin/bash
# electra with different sizes(params): small(14M), base(110M), large(335M)
model_name="google/electra-small-discriminator"

CUDA_VISIBLE_DEVICES=2 python run.py \
    --do_train \
    --model ${model_name} \
    --per_device_train_batch_size 64 \
    --task qa \
    --dataset squad \
    --output_dir ./trained_model/electra_small_squad/
