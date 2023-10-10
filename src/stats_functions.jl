using ProgressMeter

# ---

function rse_sum(a)
    sum = 0
    @showprogress for i = 1:length(a)
        sum += a[i]
    end
    return sum
end

# ---

function rse_mean(a)
    n = length(a)
    sum = rse_sum(a)
    return sum/n
end

# ---

function rse_std(a)
    n = length(a)
    mean = rse_mean(a)
    sum = rse_sum((a.-mean).^2)
    return sqrt(sum/(n-1))
end

# ---

function rse_tstat(a; σ=nothing)
    if σ == nothing
        σ = rse_std(a)
    end
    return rse_mean(a) / (rse_std(a)/(√(length(a))))
end

# ---

struct StatResult
    x       ::  Vector
    n       ::  Int64
    mean    ::  Float64
    std     ::  Float64
    tvalue  ::  Float64
end

function StatResult(x)
    return StatResult(x,
                      length(x),
                      rse_mean(x),
                      rse_std(x),
                      rse_tstat(x))
end

import Base: length

function length(x::StatResult)
    println("The true length of the StatResult is: $(x.n)")
    return 666
end

# ---
function printOwner()
    println("The owner of this repo is Manuel :)")
end