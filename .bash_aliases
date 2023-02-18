# tmux aliases
alias a='tmux -CC attach'
alias at='tmux -CC attach -t'
alias takeover="tmux detach -a"

# slurm aliases 
alias sint="srun -c 4 --gres=gpu:1 --mem=4GB --qos=nopreemption -p interactive --pty bash"
alias sintbig="srun -c 32 --gres=gpu:1 --mem=32GB --qos=nopreemption -p interactive --pty bash"
alias sintbig4="srun -c 32 --gres=gpu:4 --mem=32GB --qos=nopreemption -p interactive --pty bash"
alias sinta40="srun -c 32 --gres=gpu:4 --mem=32GB --qos=normal -p a40 --pty bash"
alias sintrtx="srun -c 32 --gres=gpu:1 --mem=32GB --qos=normal -p rtx6000 --pty bash"
alias rtxinfo="sinfo -N --Format=Partition,CPUsState,GresUsed,Gres -p rtx6000"
alias a40info="sinfo -N --Format=Partition,CPUsState,GresUsed,Gres -p a40"
alias usageinfo="sinfo -N --Format=Partition,CPUsState,GresUsed,Gres"

# torchrun aliases
alias trun4="torchrun --rdzv_backend=c10d --rdzv_endpoint=localhost:0 --nnodes=1 --nproc_per_node=4"

# other useful aliases
alias dbpython='python -m pdb -c continue'
alias gpustat='nvidia-smi -l 1'
