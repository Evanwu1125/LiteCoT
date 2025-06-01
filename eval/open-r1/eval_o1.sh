MODEL=/home/long2short/model/open-thoughts/OpenThinker2-32B
NUM_GPUS=1
MODEL_ARGS="pretrained=$MODEL,dtype=bfloat16,data_parallel_size=$NUM_GPUS,max_model_length=32768,gpu_memory_utilization=0.9,generation_parameters={max_new_tokens:32768,temperature:0.6,top_p:0.95}"
OUTPUT_DIR=data/evals/$MODEL

# # IFEval
# TASK=ifeval
# lighteval vllm $MODEL_ARGS "extended|$TASK|0|0" \
#     --use-chat-template \
#     --output-dir $OUTPUT_DIR

# # AIME 2024
# TASK=aime24
# lighteval vllm $MODEL_ARGS "lighteval|$TASK|0|0" \
#     --use-chat-template \
#     --output-dir $OUTPUT_DIR

# # AIME 2025
# TASK=aime25
# lighteval vllm $MODEL_ARGS "lighteval|$TASK|0|0" \
#     --use-chat-template \
#     --output-dir $OUTPUT_DIR

# MATH-500
TASK=math_500
lighteval vllm $MODEL_ARGS "lighteval|$TASK|0|0" \
    --use-chat-template \
    --output-dir $OUTPUT_DIR

# GPQA Diamond
TASK=gpqa:diamond
lighteval vllm $MODEL_ARGS "lighteval|$TASK|0|0" \
    --use-chat-template \
    --output-dir $OUTPUT_DIR

# # LiveCodeBench
# lighteval vllm $MODEL_ARGS "extended|lcb:codegeneration|0|0" \
#     --use-chat-template \
#     --output-dir $OUTPUT_DIR 

# lighteval vllm $MODEL_ARGS "lighteval|agieval:gaokao-mathqa|4|0" \
#     --use-chat-template \
#     --output-dir $OUTPUT_DIR 