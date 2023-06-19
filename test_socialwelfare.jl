using Plots

# Full Info:
function W(x, y, g, d, ϕ, α, c)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ * x - (α / 2) * x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ * y - (α / 2) * y
    return 1 - p_1 - c + 1 - p_2 - c
end

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.0

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = [W(x, y, g, d, ϕ, α, c) for x in x_vals, y in y_vals]

fig = plot(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "Social Welfare", title = "", color = :viridis)

savefig(fig,"socialwelfarefull.png")


#################
####### GAP 1: test difference full and lacking public goods 

# full info:
function W(x, y, g, d, ϕ, α, c)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ * x - (α / 2) * x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ * y - (α / 2) * y
    return 1 - p_1 - c + 1 - p_2 - c
end

# overlook public goods:
function W1(x, y, g, d, ϕ, c)
    p_11 = x + g * x * (1 - x) - d * (x - y) - ϕ * x 
    p_21 = y + g * y * (1 - y) - d * (y - x) - ϕ * y 
    return 1 - p_11 - c + 1 - p_21 - c
end

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = [W(x, y, g, d, ϕ, α, c) for x in x_vals, y in y_vals]
z1 = [W1(x, y, g, d, ϕ, c) for x in x_vals, y in y_vals]

gap = z - z1

fig = plot(x_vals, y_vals, gap, st = :surface, xlabel = "Pi", ylabel = "Pj", zlabel = "Difference in Total Payoff", 
title = "Social loss", color = :cool)

#to see the function ONLY:
fig = plot(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "Social Welfare", title = "", color = :viridis)

plot!(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "", title = "", color = :viridis)

plot!(x_vals, y_vals, z1, st = :surface, title = "", color = :magma)

savefig(fig,"gap1socialwelfare.png")


#########
#### GAP 2: test difference in SW full and lacking dispersal and pub goods
#########
# full info:
function W(x, y, g, d, ϕ, α, c)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ * x - (α / 2) * x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ * y - (α / 2) * y
    return 1 - p_1 - c + 1 - p_2 - c
end

# overlook public goods AND dispersal:
function W1(x, y, g, ϕ, c)
    p_11 = x + g * x * (1 - x) - ϕ * x 
    p_21 = y + g * y * (1 - y) - ϕ * y 
    return 1 - p_11 - c + 1 - p_21 - c
end

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = [W(x, y, g, d, ϕ, α, c) for x in x_vals, y in y_vals]
z1 = [W1(x, y, g, ϕ, c) for x in x_vals, y in y_vals]

gap = z - z1

fig = plot(x_vals, y_vals, gap, st = :surface, xlabel = "Pi", ylabel = "Pj", zlabel = "Difference in Total Payoff", 
title = "Social loss", color = :cool)

#to see the function ONLY:
fig = plot(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "Social Welfare", title = "", color = :viridis)

plot!(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "", title = "", color = :viridis)

plot!(x_vals, y_vals, z1, st = :surface, title = "", color = :magma)

savefig(fig,"gap2socialwelfare.png")


#########
#### GAP 3: test difference in SW full and lacking all info + pub goods
#########
# full info:
function W(x, y, g, d, ϕ, α, c)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ * x - (α / 2) * x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ * y - (α / 2) * y
    return 1 - p_1 - c + 1 - p_2 - c
end

# overlook public goods + dispersal + growth:
function W1(x, y, ϕ, c)
    p_11 = x - ϕ * x 
    p_21 = y - ϕ * y 
    return 1 - p_11 - c + 1 - p_21 - c
end

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

z = [W(x, y, g, d, ϕ, α, c) for x in x_vals, y in y_vals]
z1 = [W1(x, y, ϕ, c) for x in x_vals, y in y_vals]

gap = z - z1

fig = plot(x_vals, y_vals, gap, st = :surface, xlabel = "Pi", ylabel = "Pj", zlabel = "Difference in Total Payoff", 
title = "Social loss", color = :cool)

#to see the function ONLY:
fig = plot(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "Social Welfare", title = "", color = :viridis)

plot!(x_vals, y_vals, z, st = :surface, xlabel = "Pi", ylabel = "Pj", 
zlabel = "", title = "", color = :viridis)

plot!(x_vals, y_vals, z1, st = :surface, title = "", color = :magma)

savefig(fig,"gap3socialwelfare.png")


