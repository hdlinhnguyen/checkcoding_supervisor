using Plots
using StatsPlots ## if need

VT = zeros(Float64, 101, 101)
g = 0.5
d = 0.25
c = 0.2
ϕ = 0.4
α = 0.25
s = 0.3 

function f1(x, y)
    p_1 = x + g * x * (1 - x) - d * (x - y) 
    p_2 = y + g * y * (1 - y) - d * (y - x) 
    return (1 - p_1) + (1 - p_2)
end

function f2(x, y)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x
    p_2 = y + g * y * (1 - y) - d * (y - x)
    return (1 - p_1 - c) + (1 - p_2)
end

function f3(x, y)
    p_1 = x + g * x * (1 - x) - d * (x - y) 
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y
    return (1 - p_1) + (1 - p_2 - c)
end

function f4(x, y)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y
    return (1 - p_1 - c) + (1 - p_2 - c)
end

function f5(x, y)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
    return (1 - p_1) + s
end

function f6(x, y)
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
    return s + (1 - p_2)
end

function f7(x, y)
    p_1 = x + g * x * (1 - x) - d * (x - y) - ϕ*x - α*x
    return (1 - p_1 - c) + s
end

function f8(x, y)
    p_2 = y + g * y * (1 - y) - d * (y - x) - ϕ*y - α*y
    return s + (1 - p_2 - c)
end

x = 0:0.01:1
y = 0:0.01:1

function condition_1(x) # y <= f(x)
    return (1/d) * (1 - s) - (1/d) * (1 + g - d - (α/2)) * x + (g/d) * x^2
end

function condition_2(y) # x <= f(y)
    return (1/d)*(1 - s) - (1/d)*(1 + g - d - (α/2))*y - (g/d)*y^2
end

function condition_11(x) # y <= f(x)
    return (1/d) * (1 - s - c) - (1/d) * (1 + g - d - ϕ - (α/2)) * x + (g/d) * x^2
end

function condition_21(y) # x <= f(y)
    return (1/d)*(1 - s - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y - (g/d)*y^2
end

x_vals = 0:0.01:1
y_vals = 0:0.01:1

# TRUE SYNTAX: 
for x in x_vals
    for y in y_vals
        x_index = Int(round(x * 100) + 1)
        y_index = Int(round(y * 100) + 1)

        if (x <= c / ϕ) && (y <= c / ϕ)
            VT[x_index, y_index] = f1(x, y)

        elseif (x >= c / ϕ) && (y <= c / ϕ) && (y <= condition_1(x))
            VT[x_index, y_index] = f2(x, y)

        elseif (x <= c / ϕ) && (y >= c / ϕ) && (x <= condition_2(y))
            VT[x_index, y_index] = f3(x, y)

        elseif (x >= c / ϕ) && (y >= c / ϕ) && (y <= condition_11(x))  && (x <= condition_21(y))
            VT[x_index, y_index] = f4(x, y)

        elseif (x <= c / ϕ) && (y <= c / ϕ) && (x >= condition_2(y))
            VT[x_index, y_index] = f5(x, y)

        elseif (x <= c / ϕ) && (y <= c / ϕ) && (y >= condition_1(x))
            VT[x_index, y_index] = f6(x, y)

        elseif (x >= c / ϕ) && (y >= c / ϕ) && (y >= condition_11(x)) && (x <= condition_21(y))
            VT[x_index, y_index] = f7(x, y)

        elseif (x >= c / ϕ) && (y >= c / ϕ) && (x >= condition_21(y)) && (y <= condition_11(x))
            VT[x_index, y_index] = f8(x, y)
        end
    end
end

VT ## to see 

pyplot() ## borrow from python pkg
fig = heatmap(0:0.01:1, 0:0.01:1, VT, xlabel = "P1", ylabel = "P2",title = "Total Payoff", 
              color = :viridis, aspect_ratio=:equal)
