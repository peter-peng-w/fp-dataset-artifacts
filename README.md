# UT NLP Course Final Project: dataset-artifacts

Project by Kaj Bostrom, Jifan Chen, and Greg Durrett. Code by Kaj Bostrom and Jifan Chen.

## Coding
### How to run the code
The training and evaluation commands are written in bash file. Directly run
`
bash train_qa_squad.sh
`
to train the model, and run
`
bash eval_qa_squad.sh
`
to evaluate the model. You might need to change some of the parameters in the bash file, for example the batch-size and which model you want to load.

### Working with datasets
This repo uses [Huggingface Datasets](https://huggingface.co/docs/datasets/) to load data.
The Dataset objects loaded by this module can be filtered and updated easily using the `Dataset.filter` and `Dataset.map` methods.
For more information on working with datasets loaded as HF Dataset objects, see [this page](https://huggingface.co/docs/datasets/process.html).

## Project Description

We focus on examine the fine-tune model's performance on adversarial examples and also try to use adversarial training to somehow fix this issue.

### Model Selection

As suggested by the instruction, we work on ELECTRA ([model](https://huggingface.co/docs/transformers/model_doc/electra), [paper](https://openreview.net/pdf?id=r1xMH1BtvB)) which is a BERT-like model that works well on reading comprehension task (i.e., extract the answer from the given context). There are 3 versions of the pre-trained ELECTRA models with different model size:

| Model    | Number of Params |
| :--------: | :-------: |
| small  | 14M    |
| base | 110M     |
| large    | 335M    |

For efficiency, we focus on the ELECTRA-small temporarily, but will extend it to larger models if we have time.

### Dataset Selection

We focus on the [SQuAD dataset](https://rajpurkar.github.io/SQuAD-explorer/) which is a reading comprehension dataset, consisting of questions posed by crowdworkers on a set of Wikipedia articles, where the answer to every question is a segment of text, or span, from the corresponding reading passage, or the question might be unanswerable (only supported in v2.0). For simplicity, we work on the v1.1 of this dataset (therefore we don't need to consider the unanswerable problem).

In order to examine ELECTRA which fine-tuned on the SQuAD dataset, we take a look at its performance on 2 adversarial datasets:

1. Adversarial-SQuAD ([paper](https://aclanthology.org/D17-1215), [code](https://github.com/robinjia/adversarial-squad), [data](https://worksheets.codalab.org/worksheets/0xc86d3ebe69a3427d91f9aaa63f7d1e7d/))
2. Adversarial-QA ([paper](https://arxiv.org/abs/2002.00293), [webpage](https://adversarialqa.github.io/), [data](https://huggingface.co/datasets/adversarial_qa))
