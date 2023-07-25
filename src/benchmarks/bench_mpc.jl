# Run benchmarks on Maros-Meszaros problems

# include any solvers you want to test 
using ClarabelBenchmarks, DataFrames, JLD2
using Clarabel, ECOS,OSQP, HiGHS
using Gurobi, MosekTools
using ClarabelRs

#use caution running these two because they are very slow for some problems
using HiGHS
#using Hypatia 

#solvers = [ClarabelRs,Gurobi,Mosek,Clarabel,ECOS,HiGHS] 
solvers = [Clarabel,Gurobi,Mosek,ClarabelRs,ECOS]
solvers = [Hypatia,Clarabel,Mosek,ClarabelRs,ECOS,Gurobi,OSQP]
tag     = nothing
class   = ["mpc"]
verbose = false
time_limit = 120.
rerun = false
#plotlist = [Mosek,ClarabelRs,ECOS,Gurobi] 

df = ClarabelBenchmarks.bench_common(
    @__FILE__, solvers, class;
    time_limit = time_limit,
    verbose = verbose, tag = tag, rerun = rerun)