using Plots

#####################################################
# Full Info: i does cropland and j also does cropland
#####################################################
function W(x, y, g, d, ϕ, α, c)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ * x - (α / 2) * x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ * y - (α / 2) * y
    if x >= c/ϕ && y >= c/ϕ
        return 1 - p_1 - c + 1 - p_2 - c
    else 
        return 1 - p_1 + 1 - p_2
    end
end

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = [W(x, y, g, d, ϕ, α, c) for x in x_vals, y in y_vals]

fig = plot(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "Total payoff", title = "", color = :viridis)

#####################################################
### Full Info: i does cropland and j follows NCH
#####################################################
function W(x, y, g, d, ϕ, α, c)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ * x - (α / 2) * x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ * y - (α / 2) * y
    if x >= c/ϕ && y >= c/ϕ
        return 1 - p_1 - c + 1 - p_2 - c
    else 
        return 1 - p_1 + 1 - p_2
    end
end

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = [W(x, y, g, d, ϕ, α, c) for x in x_vals, y in y_vals]

fig = plot(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "Total payoff", title = "", color = :viridis)










