using Plots

function W(x, y, g, d, ϕ, c, α, π)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ * x - (α / 2) * x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ * y - (α / 2) * y
    if x <= c/ϕ && y <= c/ϕ && (y >= ((1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2)) && (x >= ((1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2))
        return 1 - p_1 + 1 - p_2
    elseif x >= c/ϕ && y >= c/ϕ && ((y >= (1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y + (g/d)*y^2)) && ((x >= (1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y + (g/d)*y^2))
        return 1 - p_1 - c + 1 - p_2 - c
    elseif x >= c/ϕ && y <= c/ϕ && (y >= ((1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y + (g/d)*y^2)) && (x >= ((1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2))
        return 1 - p_1 - c + 1 - p_2 
    elseif x >= c/ϕ && y <= c/ϕ && ((y >= (1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2)) && ((x >= (1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y + (g/d)*y^2))
        return 1 - p_1 + 1 - p_2 -c
    elseif x >= c/ϕ && y <= c/ϕ && ((y >= (1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y + (g/d)*y^2)) && ((x >= (1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2))
        return 1 - p_1 - c + 1 - p_2
    elseif x >= c/ϕ && y >= c/ϕ && ((y <= (1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2)) && ((x >= (1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y + (g/d)*y^2))
        return 0.3 + 1 - p_2 - c
    elseif x >= c/ϕ && y >= c/ϕ && ((y >= (1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2)) && ((x <= (1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2))
        return 1 - p_1 -c + 0.3
    end
end

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25
π = 0.3

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = [W(x, y, g, d, ϕ, c, α, π) for x in x_vals, y in y_vals]

fig = heatmap(x_vals, y_vals, z, xlabel = "Pi", ylabel = "Pj",
              zlabel = "", title = "Total Payoff", color = :viridis)
