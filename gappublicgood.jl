####### NEW GAP IN TOT PAYOFF IN CASE OF LACKING ALL ECOLOGICAL 
function W2(x, y, g, d, ϕ, c, α, s)
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 + 1 - p_2 

    elseif x >= c/ϕ && y <= c/ϕ && 
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


####################### THE GAP WITH THE RANGE OF COLOR IN GRADIENT #######
using Plots
using ColorSchemes

g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25
s = 0.3 #subsidy or π^NCH

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

################ Full Info Payoff: ######################
function W(x, y, g, d, ϕ, c, α, s)
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 + 1 - p_2 

    elseif x >= c/ϕ && y <= c/ϕ ##########
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 0

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
            
##### Payoff in case of OVERLOOK public goods:
function W1(x, y, g, d, ϕ, c, α, s)
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 + 1 - p_2 

    elseif x >= c/ϕ && y <= c/ϕ ##########
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 0

    elseif x <= c/ϕ && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 + 1 - p_2 - c

    elseif x >= c/ϕ && y >= c/ϕ && x<= 0.79 && y<= 0.79
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 - c + 1 - p_2 - c

    elseif x >= 0.79  && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return s + 1 - p_2 - c

    elseif x >= c/ϕ && y >= 0.79
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return 1 - p_1 - c + s

    elseif x >= 0.79 && y >= 0.79
        return s + s
    end
end

z1 = [W1(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]

### DIFFERENCE ici:
gap = z - z1

gap = z1 - z

fig = heatmap(x_vals, y_vals, gap, xlabel = "P1", ylabel = "P2", color = :roma, 
legend = :right, title = "Difference in Total Payoff", aspect_ratio=:equal)

################ FOR THE RANGE OF THE GAP HERE: ###############################
color_map = cgrad([:red, :white, :blue])

clim_min = minimum(gap)
clim_max = maximum(gap)
clim_range = max(abs(clim_min), abs(clim_max))

# Set up the plot with custom color scheme
pyplot()
fig = heatmap(x_vals, y_vals, gap, xlabel="P1", ylabel="P2",
              color=color_map, legend=:right, title="Difference in Total Payoff",
              aspect_ratio=:equal, clim=(-clim_range, clim_range))











#######################################
########### ALL ECOLOGICAL INFO AND PUBLIC GOODS 
#######################################
using Plots
g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25
s = 0.3 #subsidy or π^NCH

x_vals = range(0, stop = 1, length = 100)
y_vals = range(0, stop = 1, length = 100)

##### Full Info Payoff:
function W(x, y, g, d, ϕ, c, α, s)
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 + 1 - p_2 

    elseif x >= c/ϕ && y <= c/ϕ ##########
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 0

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
        return ((1 - p_1 - c + s) + (s + 1 - p_2 - c))/2
    end
end

z = [W(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]
            
##### Payoff in case of OVERLOOK all ecological info and public goods:
function W2(x, y, g, d, ϕ, c, α, s)
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 + 1 - p_2 

    elseif x >= c/ϕ && y <= c/ϕ ##########
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 1 - p_1 - c  + 1 - p_2 

    elseif x <= c/ϕ && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 + 1 - p_2 - c

    elseif x >= c/ϕ && y >= c/ϕ && x<= 0.85 && y<= 0.85
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 - c + 1 - p_2 - c

    elseif x >= 0.85  && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return s + 1 - p_2 - c

    elseif x >= c/ϕ && y >= 0.85 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return 1 - p_1 - c + s

    elseif x >= 0.85 && y >= 0.85
        return ((1 - p_1 - c + s) + (s + 1 - p_2 - c))/2
    end
end

z2 = [W2(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]

### DIFFERENCE ici:
gap2 = z - z2

pyplot()
fig = heatmap(x_vals, y_vals, gap2, xlabel = "Pi", ylabel = "Pj", color = :heat, 
legend = :right, title = "Difference in Total Payoff", aspect_ratio=:equal)

savefig(fig,"gap2.png")

#### TEST
# Define the color map with custom colors and ranges
color_map = cgrad([:red, :white, :blue])

# Customize the color range based on your data
clim_min = minimum(gap2)
clim_max = maximum(gap2)
clim_range = max(abs(clim_min), abs(clim_max))

# Set up the plot with custom color scheme
pyplot()
fig = heatmap(x_vals, y_vals, gap2, xlabel="Pi", ylabel="Pj",
              color=color_map, legend=:right, title="Difference in Total Payoff",
              aspect_ratio=:equal, clim=(-clim_range, clim_range))

# Show the plot
display(fig)















######################## for nice fig
##### Full Info Payoff:
function W(x, y, g, d, ϕ, c, α, s)
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 0

    elseif x >= c/ϕ && y <= c/ϕ ##########
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 0

    elseif x <= c/ϕ && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 0

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
        return ((1 - p_1 - c + s) + (s + 1 - p_2 - c))/2
    end
end

z = [W(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]
            
##### Payoff in case of OVERLOOK public goods:
function W2(x, y, g, d, ϕ, c, α, s)
    if x <= c/ϕ && y <= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 0

    elseif x >= c/ϕ && y <= c/ϕ ##########
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - α*y
        return 0

    elseif x <= c/ϕ && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 0

    elseif x >= c/ϕ && y >= c/ϕ && x<= 0.85 && y<= 0.85
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
        return 1 - p_1 - c + 1 - p_2 - c

    elseif x >= 0.85  && y >= c/ϕ 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return s + 1 - p_2 - c

    elseif x >= c/ϕ && y >= 0.85 
        p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x 
        p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y 
        return 1 - p_1 - c + s

    elseif x >= 0.85 && y >= 0.8
        return ((1 - p_1 - c + s) + (s + 1 - p_2 - c))/2
    end
end

z2 = [W2(x, y, g, d, ϕ, c, α, s) for x in x_vals, y in y_vals]

### DIFFERENCE ici:
gap2 = z - z2

fig = heatmap(x_vals, y_vals, gap2, xlabel = "Pi", ylabel = "Pj", color = :heat, 
legend = :right, title = "Difference in Total Payoff", aspect_ratio=:equal)