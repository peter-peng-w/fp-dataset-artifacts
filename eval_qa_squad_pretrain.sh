#!/bin/bash
model_name="google/electra-small-discriminator"

CUDA_VISIBLE_DEVICES=2 python run.py \
    --do_eval \
    --task qa \
    --dataset squad \
    --model ${model_name} \
    --output_dir ./eval_output/electra_small_squad/pretrain/
