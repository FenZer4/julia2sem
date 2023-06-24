"""Алгоритм решето Эратосфена"""
function eratosphen(n::Integer)
    is_prime = ones(Bool, n) 
    is_prime[1] = false
    for i in 2:round(Int, sqrt(n))
        if is_prime[i] 
            for j in (i*i):i:n 
                is_prime[j] = false
            end
        end
    end
    return (1:n)[is_prime]
end


print(eratosphen(20))
