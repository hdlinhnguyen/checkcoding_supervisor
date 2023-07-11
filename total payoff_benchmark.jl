VT = zeros(Float64, 101, 101)

for x in 0:100 
    for y in 0:100
        VT[x+1, y+1] = rand()
    end
end
