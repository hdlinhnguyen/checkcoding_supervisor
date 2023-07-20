##### Second trying to visualize the heatmap: 
##### Conditions are now inside each if.. elseif... else condition
##### It is able to visualize, but it is not a true matrix as the figure with line only

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
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 + 1 - p_2 

    elseif x >= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 - c  + 1 - p_2 

    elseif x <= c/ϕ && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 + 1 - p_2 - c

    elseif x >= c/ϕ && y >= c/ϕ && x<= 0.79 && y<= 0.79
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 - c + 1 - p_2 - c

    elseif x >= 0.79 && y >= c/ϕ  
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return s + 1 - p_2 - c

    elseif x >= c/ϕ && y >= 0.79 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 - c + s

    elseif x >= 0.79 && y >=0.79
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return ((1 - p_1 - c + s) + (s + 1 - p_2 - c))/2
    end
end

z = [W(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]

pyplot()
fig = heatmap(x_vals, y_vals, z, xlabel = "P1", ylabel = "P2",
              zlabel = "", title = "Total Payoff", color = :viridis, aspect_ratio=:equal)
