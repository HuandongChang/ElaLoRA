python -m torch.distributed.launch --master_port=8679 --nproc_per_node=1 \
examples/question-answering/run_qa.py \
--model_name_or_path microsoft/deberta-v3-base \
--dataset_name squad_v2 \
--apply_lora --apply_elalora --lora_type svd \
--target_rank 2  --lora_r 2  \
--reg_orth_coef 0.1 \
--init_warmup 10 --final_warmup 10 --mask_interval 100 \
--b 1 --k 1 \
--beta1 0.85 --beta2 0.85 \
--lora_module query,key,value,intermediate,layer.output,attention.output \
--lora_alpha 16 \
--do_train --do_eval --version_2_with_negative \
--max_seq_length 384 --doc_stride 128 \
--per_device_train_batch_size 16 \
--learning_rate 1e-3 \
--num_train_epochs 12 \
--max_step 300 \
--warmup_steps 1000 --per_device_eval_batch_size 128 \
--evaluation_strategy steps --eval_steps 3000 \
--save_strategy steps --save_steps 100000 \
--logging_steps 300 \
--tb_writter_loginterval 300 \
--report_to tensorboard \
--seed 9 \
--enable_scheduler True \
--root_output_dir ./output/debertav3-base/squadv2 \
--overwrite_output_dir 
