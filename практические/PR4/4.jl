"""Обратный ход метода Гаусса"""
function reversedGauss(Matrix, b)
    x = similar(b)
    n = size(Matrix, 1)

    for k in 0:n-1
        x[n - k] = (b[n - k] - sum(@view(Matrix[n-k, n-k+1 : n]) .* @view(x[n-k+1:n]))) / Matrix[n-k, n-k]
    end
    return x
end

Matrix = [1.0 2.0 3.0; 4.0 4.0 4.0; 1.0 2.0 3.0]
b = [4.0; 5.0; 6.0]

println(reversedGauss(Matrix, b))
