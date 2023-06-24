

"""Приводит матрицу к ступенчатому виду"""
function toUpperTriangle!(Matrix)
    coef(a, b) = b / a
    
    n, m = size(Matrix)
    for t in 1:m-1
        for i in t+1:n
            c = coef(Matrix[t, t], Matrix[i, t])
            Matrix[i, t] = 0
            for j in t+1:m
                Matrix[i, j] -= c * Matrix[t, j]
            end
        end
    end

    return Matrix
end

A = [ 1 2 3;
      0 4 5;
      0 0 6 ]
	
x = toUpperTriangle!(A)
println(x) 
