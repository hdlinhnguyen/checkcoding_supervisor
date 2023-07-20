########################
####### Problem: conditions represent the value computed from the parameters and value of variable x or y
#####################
using Plots
g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25
s = 0.3 

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

function W(x, y, g, d, ϕ, c, α, s)
    condition_3 = (1/d)*(1 - s - c) - (1/d)*(1 + g - d - ϕ)*x - (g/d)*x^2
    condition_4 = (1/d)*(1 - s - c) - (1/d)*(1 + g - d - ϕ)*y - (g/d)*y^2
    condition_31 = (1/d)*(1 - s - c) - (1/d)*(1 + g - d - ϕ - (α/2))*x - (g/d)*x^2
    condition_41 = (1/d)*(1 - s - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y - (g/d)*y^2
    
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) 
        p_2 = y + g * y * (1 - y) - d * (y - x)
        return 1 - p_1 + 1 - p_2 

    elseif x >= c/ϕ && y >= c/ϕ && y <= condition_3 && x <= condition_4 #y <= f(x) && x <= f(y)
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y
        return 1 - p_1 - c + 1 - p_2 - c

    elseif x <= c/ϕ && y >= c/ϕ && x <= condition_4
        p_1 = x + g * x * (1 - x) - d * (x - y)
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y
        return 1 - p_1 + 1 - p_2 - c

    elseif x >= c/ϕ && y <= c/ϕ && y <= condition_3
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x
        p_2 = y + g * y * (1 - y) - d * (y - x) 
        return 1 - p_1 - c  + 1 - p_2 
    
    elseif x >= c/ϕ && y >= c/ϕ && y >= condition_3 && x <= condition_41
        p_1 = x + g * x * (1 - x) - d * (x - y)
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y
        return s + (1 - P_2 - c + ϕ*y + (α/2)*y)
    
    elseif x >= c/ϕ && y >= c/ϕ && y <= condition_31 && x >= condition_4
        p_1 = x + g * x * (1 - x) - d * (x - y) 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y
        return (1 - P_1 - c + ϕ*x + (α/2)*x) + s
    end
end

z = [W(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]

fig = heatmap(x_vals, y_vals, z, xlabel = "Pi", ylabel = "Pj",
              zlabel = "", title = "Total Payoff", color = :viridis)
