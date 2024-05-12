#!/bin/bash

# generate Julia solver modules environment variables
source modules.sh

#the benchmark tests to run
export BENCHMARK_CLASS_KEY="opf_socp"

#the time limit for individual problems
export BENCHMARK_PROBLEM_TIME_LIMIT=3600

#total runtime timeout per solver for this set of problems
export BENCHMARK_SLURM_TIME_LIMIT=23:59:00

#non standard partition since time limit exceeds short partition bound
export BENCHMARK_SLURM_PARTITION="long"

#the list of solvers to test   
export BENCHMARK_SOLVER_ARRAY="\
$MODULE_Clarabel128,\
"

#makes a slurm configuration file and calls sbatch
source make_slurm_conf.sh $BENCHMARK_CLASS_KEY
