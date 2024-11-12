# python -m torch.distributed.launch --master_port=8679 --nproc_per_node=1 \
# examples/text-classification/run_glue.py \
# --model_name_or_path microsoft/deberta-v3-base \
# --task_name mnli \
# --apply_adalora --apply_lora --lora_type svd \
# --target_rank 1  --lora_r 3  \
# --reg_orth_coef 0.1 \
# --init_warmup 8000 --final_warmup 50000 --mask_interval 100 \
# --beta1 0.85 --beta2 0.85 \
# --lora_module query,key,value,intermediate,layer.output,attention.output \
# --lora_alpha 16 \
# --do_train --do_eval \
# --max_seq_length 256 \
# --per_device_train_batch_size 32 --learning_rate 5e-4 --num_train_epochs 7 \
# --warmup_steps 1000 \
# --cls_dropout 0.15 --weight_decay 0 \
# --evaluation_strategy steps --eval_steps 3000 \
# --save_strategy steps --save_steps 30000 \
# --logging_steps 500 \
# --seed 6 \
# --root_output_dir ./output/glue/mnli \
# --overwrite_output_dir


python -m torch.distributed.launch --master_port=8679 --nproc_per_node=1 \
examples/text-classification/run_glue.py \
--model_name_or_path microsoft/deberta-v3-small \
--task_name mnli \
--apply_adalora --apply_lora --lora_type svd \
--target_rank 10  --lora_r 10 \
--reg_orth_coef 0.1 \
--init_warmup 500 --final_warmup 1000 --mask_interval 500 \
--beta1 0.85 --beta2 0.85 \
--lora_module query,key,value,intermediate,layer.output,attention.output \
--lora_alpha 16 \
--do_train --do_eval \
--max_seq_length 256 \
--per_device_train_batch_size 64 \
--learning_rate 5e-4 --num_train_epochs 1 \
--warmup_steps 1000 \
--cls_dropout 0.15 --weight_decay 0 \
--evaluation_strategy steps --eval_steps 3000 \
--save_strategy steps --save_steps 30000 \
--logging_steps 500 \
--seed 6 \
--root_output_dir ./output_ela_test/glue/mnli \
--overwrite_output_dir