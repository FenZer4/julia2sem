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

"""Определитель матрицы"""
function det(Matrix)
    toUpperTriangle!(Matrix)
    det = 1
    i = 1
    while (i <= size(Matrix, 1))
        if (Matrix[i, i] != 0)
            det *= Matrix[i, i]
            i+=1
        else break end
    end
    return det
end
Matrix = [1 2 4 ; 3 5 2 ; 2 6 7]

println(det(Matrix))
println(Matrix) 