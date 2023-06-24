# Метод Гаусса

function gauss(A::Matrix, b::Vector)
    n = size(A, 1)
    for i = 1:n
        # Частичный выбор главного элемента
        max_indx = i
        for j = i+1:n
            if abs(A[j, i]) > abs(A[max_indx, i])
                max_indx = j
            end
        end
        if max_indx != i
            A[i, :], A[max_indx, :] = A[max_indx, :], A[i, :]
            b[i], b[max_indx] = b[max_indx], b[i]
        end
        
        # Прямой ход метода Гаусса
        for j = i+1:n
            m = A[j, i] / A[i, i]
            A[j, i:end] = A[j, i:end] - m*A[i, i:end]
            b[j] = b[j] - m*b[i]
        end
    end
    
    # Обратный ход метода Гаусса
    x = zeros(n)
    for i = n:-1:1
        x[i] = b[i]
        for j = i+1:n
            x[i] = x[i] - A[i, j]*x[j]
        end
        x[i] = x[i] / A[i, i]
    end
    
    return x
end

A = [ 1 2 3;
      0 4 5;
      0 0 6 ]
b = [ 6;
      5;
      3 ]
x = gauss(A, b)
println(x) 