#!/bin/bash
CUDA_VISIBLE_DEVICES=2 python run.py \
    --do_eval \
    --task qa \
    --dataset adversarial_qa \
    --model ./trained_model/electra_small_squad/ \
    --output_dir ./eval_output/electra_small_squad/
