module MyStatsPackage
using ProgressMeter
include("stats_functions.jl")

export rse_sum
export rse_mean, rse_std, rse_tstat

end
