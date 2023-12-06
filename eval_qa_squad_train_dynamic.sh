#!/bin/bash

dataset_path="./data/squad_1.1/dev-v1.1.json"
dataset_path_dev_sample="./data/squad_adv/none_n1000_k1_s0.json"
dataset_path_adv_squad_AddOneSent="./data/squad_adv/sample1k-HCVerifySample_only_adv.jsonl"
dataset_path_adv_squad_AddSent="./data/squad_adv/sample1k-HCVerifyAll_only_adv.jsonl"
dataset_path_adv_squad_AddModSent="./data/squad_adv/sample1k-HCVerifyModAll_only_adv.jsonl"
dataset_path_adv_qa="./data/adv_qa/combined/dev.json"
training_dynamic_epoch=0

CUDA_VISIBLE_DEVICES=7 python run.py \
    --do_eval \
    --task qa \
    --dataset ${dataset_path} \
    --per_device_train_batch_size 64 \
    --model "./trained_model/electra_small_squad/fine-tune/3epochs_new/checkpoint-epoch-${training_dynamic_epoch}" \
    --output_dir ./eval_output/electra_small_squad/fine-tune/SQuAD/ \
    --eval_train_dynamic_epoch ${training_dynamic_epoch} \

