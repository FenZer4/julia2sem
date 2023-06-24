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

"""Ранг матрицы"""
function rank(Matrix)
    toUpperTriangle!(Matrix)
    i = 1
    while(Matrix[i, i] != 0)
        i+=1
    end
    return i-1
end

A = [1.0 2.0 4.0 2.0; 3.0 5.0 2.0 11.0; 2.0 6.0 7.0 9.0]

println(rank(A))