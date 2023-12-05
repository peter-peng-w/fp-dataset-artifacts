#!/bin/bash

dataset_path="./data/squad_1.1/dev-v1.1.json"
dataset_path_dev_sample="./data/squad_adv/none_n1000_k1_s0.json"
dataset_path_adv_squad_AddOneSent="./data/squad_adv/sample1k-HCVerifySample_only_adv.jsonl"
dataset_path_adv_squad_AddSent="./data/squad_adv/sample1k-HCVerifyAll_only_adv.jsonl"
dataset_path_adv_squad_AddModSent="./data/squad_adv/sample1k-HCVerifyModAll_only_adv.jsonl"
dataset_path_adv_qa="./data/adv_qa/combined/dev.json"

CUDA_VISIBLE_DEVICES=2 python run.py \
    --do_eval \
    --task qa \
    --dataset ${dataset_path_adv_qa} \
    --model ./trained_model/electra_small_squad/adv_train_adv_qa/ \
    --output_dir ./eval_output/electra_small_squad/adv_train_adv_qa/adv_qa/

