using Plots, ColorSchemes

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25
s = 0.3 #subsidy or π^NCH

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = zeros(length(x_vals), length(y_vals))

function W(x, y, g, d, ϕ, c, α, s)
    # C,C
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) 
        p_2 = y + g * y * (1 - y) - d * (y - x) 
        return 1 - p_1 + 1 - p_2 
    
    # P,C
    elseif x >= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) 
        return 1 - p_1 - c  + 1 - p_2 
    
    # C,P
    elseif x <= c/ϕ && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y)
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return 1 - p_1 + 1 - p_2 - c

    # P,P
    elseif x >= c/ϕ && y >= c/ϕ && x<= 0.79 && y<= 0.79
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return 1 - p_1 - c + 1 - p_2 - c
    
    # NCH,P
    elseif x >= c/ϕ && y >= c/ϕ && x >= 0.79 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return s + 1 - p_2 - c

   # P,NCH 
   elseif x >= c/ϕ && y >= c/ϕ && y >= 0.79 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return 1 - p_1 - c + s
        
   # undetermined: take as weighted sum: ((P,NCH)+(NCH,P))/2
   elseif x >= 0.79 && y >=0.79
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return ((1 - p_1 - c + s) + (s + 1 - p_2 - c))/2
    end
end

for (i, x) in enumerate(x_vals)
    for (j, y) in enumerate(y_vals)
        z[i, j] = W(x, y, g, d, ϕ, c, α, s)
    end
end
### double check matrix for me:
z = [W(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]

fig = heatmap(x_vals, y_vals, z, xlabel = "Pi", ylabel = "Pj",
              zlabel = "", title = "Total Payoff", color = :viridis, cbar = true, aspect_ratio=:equal)
