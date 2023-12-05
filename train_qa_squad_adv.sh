#!/bin/bash
# electra with different sizes(params): small(14M), base(110M), large(335M)
model_name="google/electra-small-discriminator"
dataset_path="./data/squad_1.1/train-v1.1.json"
dataset_path_adv_squad="./data/squad_adv/train-convHighConf-indent.json"
dataset_path_adv_qa="./data/adv_qa/combined/train.json"

CUDA_VISIBLE_DEVICES=2 python run.py \
    --num_train_epochs 5 \
    --do_train \
    --model ${model_name} \
    --per_device_train_batch_size 64 \
    --task qa \
    --dataset ${dataset_path} \
    --adv_dataset ${dataset_path_adv_qa} \
    --output_dir ./trained_model/electra_small_squad/adv_train_adv_qa/5epochs \
