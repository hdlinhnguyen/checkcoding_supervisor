using Plots

function f(x, g, ϕ, α, c, d)
    y = x + g*x*(1-x) - d*(x-0.9) - ϕ*x - α*x*0.5
    profit_phi = 1 - y - c 
    if x >= c/ϕ 
        return profit_phi
    else 
        return NaN
    end
end

function h(x, g, α, d)
    y = x + g*x*(1-x) - d*(x-0.5) - α*x*0.5
    profit_nonphi = 1 - y
    if x <= c/ϕ 
        return profit_nonphi
    else 
        return NaN
    end
end

function a(x, g, ϕ, α, c, d)
    y = x + g*x*(1-x) - d*(x-0.9) - ϕ*x 
    profit_phi = 1 - y - c 
    if x >= c/ϕ 
        return profit_phi
    else 
        return NaN
    end
end

function b(x, g, α, d)
    y = x + g*x*(1-x) - d*(x-0.5) 
    profit_nonphi = 1 - y
    if x <= c/ϕ 
        return profit_nonphi
    else 
        return NaN
    end
end

d = 0.25
g = 0.5  
ϕ = 0.4
α = 0.25
c = 0.2
π = 0.3

X = 0:0.01:1


#plot ici:
pyplot()
fig=plot(X, f.(X, g, ϕ, α, c, d),  xlabel="Pi: pest density on i's property", ylabel="payoff",
     title="Individual i", linecolor=:red, linewidth=2, label="crop profit")

     plot!(X, h.(X, g, α, d), linecolor=:red, linewidth=2, label="")

hline!([π], linestyle=:dash, linecolor=:black, label="subsidy")

vline!([θ], linestyle=:dash, linecolor=:purple, label="pest threshold")

plot!(legend=:topright)



#### test difference: WITHOUT ALPHA BUT FULL KNOWLEDGE
using Plots

function f(x, g, ϕ, α, c, d)
    y = x + g*x*(1-x) - d*(x-0.9) - ϕ*x - α*x*0.5
    profit_phi = 1 - y - c 
    if x >= c/ϕ 
        return profit_phi
    else 
        return NaN
    end
end

function h(x, g, α, d)
    y = x + g*x*(1-x) - d*(x-0.5) - α*x*0.5
    profit_nonphi = 1 - y
    if x <= c/ϕ 
        return profit_nonphi
    else 
        return NaN
    end
end

function a(x, g, ϕ, α, c, d)
    y = x + g*x*(1-x) - d*(x-0.9) - ϕ*x 
    profit_phi1 = 1 - y - c 
    if x >= c/ϕ 
        return profit_phi1
    else 
        return NaN
    end
end

function b(x, g, α, d)
    y = x + g*x*(1-x) - d*(x-0.5) 
    profit_nonphi1 = 1 - y
    if x <= c/ϕ 
        return profit_nonphi1
    else 
        return NaN
    end
end

d = 0.25
g = 0.5  
ϕ = 0.4
α = 0.25
c = 0.2
π = 0.3

X = 0:0.01:1

# Plot f, a, h, and b
pyplot()
fig = plot(X, f.(X, g, ϕ, α, c, d), xlabel="Pi: pest density on i's property", ylabel="payoff",
    title="Individual i", linecolor=:blue, linewidth=2, label="crop profit with public goods")

plot!(X, a.(X, g, ϕ, α, c, d), linecolor=:red, linewidth=2, label="crop profit without public goods")

plot!(X, h.(X, g, α, d), linecolor=:blue, linewidth=2, label="")

plot!(X, b.(X, g, α, d), linecolor=:red, linewidth=2, label="")

fill_between!(X, f.(X, g, ϕ, α, c, d), a.(X, g, ϕ, α, c, d), fill=:blue, alpha=0.3, label="f - a")

fill_between!(X, h.(X, g, α, d), b.(X, g, α, d), fill=:orange, alpha=0.3, label="h - b")

savefig(fig,"compareprofit alpha.png")


#### test difference:
using Plots

function f(x, g, ϕ, α, c, d)
    y = x + g*x*(1-x) - d*(x-0.9) - ϕ*x - α*x*0.5
    profit_phi = 1 - y - c 
    if x >= c/ϕ 
        return profit_phi
    else 
        return NaN
    end
end

function h(x, g, α, d)
    y = x + g*x*(1-x) - d*(x-0.5) - α*x*0.5
    profit_nonphi = 1 - y
    if x <= c/ϕ 
        return profit_nonphi
    else 
        return NaN
    end
end

function a(x, ϕ, c)
    y = x  - ϕ*x 
    profit_phi1 = 1 - y - c
    if x >= c/ϕ 
        return profit_phi1
    else 
        return NaN
    end
end

function b(x)
    y = x 
    profit_nonphi1 = 1 - y
    if x <= c/ϕ 
        return profit_nonphi1
    else 
        return NaN
    end
end

d = 0.25
g = 0.5  
ϕ = 0.4
α = 0.25
c = 0.2
π = 0.3

X = 0:0.01:1

# Plot f, a, h, and b
pyplot()
fig = plot(X, f.(X, g, ϕ, α, c, d), xlabel="Pi: pest density on i's property", ylabel="payoff",
    title="Individual i", linecolor=:blue, linewidth=2, label="crop profit with full info")

plot!(X, a.(X, ϕ, c), linecolor=:red, linewidth=2, label="crop profit without info")

plot!(X, h.(X, g, α, d), linecolor=:blue, linewidth=2, label="")

plot!(X, b.(X), linecolor=:red, linewidth=2, label="")

fill_between!(X, f.(X, g, ϕ, α, c, d), a.(X, g, ϕ, α, c, d), fill=:blue, alpha=0.3, label="f - a")

fill_between!(X, h.(X, g, α, d), b.(X, g, α, d), fill=:orange, alpha=0.3, label="h - b")

savefig(fig,"compareprofitinfo.png")

######## comparison profit of incomplete info on dispersal and public goods:
using Plots

function f(x, g, ϕ, α, c, d)
    y = x + g*x*(1-x) - d*(x-0.9) - ϕ*x - α*x*0.5
    profit_phi = 1 - y - c 
    if x >= c/ϕ 
        return profit_phi
    else 
        return NaN
    end
end

function h(x, g, α, d)
    y = x + g*x*(1-x) - d*(x-0.5) - α*x*0.5
    profit_nonphi = 1 - y
    if x <= c/ϕ 
        return profit_nonphi
    else 
        return NaN
    end
end

function a(x, g, ϕ, c)
    y = x + g*x*(1-x) - ϕ*x 
    profit_phi1 = 1 - y - c
    if x >= c/ϕ 
        return profit_phi1
    else 
        return NaN
    end
end

function b(x, g)
    y = x + g*x*(1-x)
    profit_nonphi1 = 1 - y
    if x <= c/ϕ 
        return profit_nonphi1
    else 
        return NaN
    end
end

d = 0.25
g = 0.5  
ϕ = 0.4
α = 0.25
c = 0.2
π = 0.3

X = 0:0.01:1

# Plot f, a, h, and b
pyplot()
fig = plot(X, f.(X, g, ϕ, α, c, d), xlabel="Pi: pest density on i's property", ylabel="payoff",
    title="Individual i", linecolor=:blue, linewidth=2, label="crop profit with full info")

plot!(X, a.(X, g, ϕ, c), linecolor=:red, linewidth=2, label="crop profit without info")

plot!(X, h.(X, g, α, d), linecolor=:blue, linewidth=2, label="")

plot!(X, b.(X, g), linecolor=:red, linewidth=2, label="")

hline!([π], linestyle=:dash, linecolor=:black, label="subsidy")

savefig(fig,"compareprofitdispersalalpha.png")