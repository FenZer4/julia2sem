#Решето Эратосфена
function resheto(n::Integer)
    prime_indexes = ones(Bool, n)
    prime_indexes[begin] = false
    i = 2
    prime_indexes[i^2:i:n] .= false 
    i = 3
   
    while i <= n
        prime_indexes[i^2:2i:n] .= false
        i+=1
        while i <= n && prime_indexes[i] == false
            i+=1
        end

    end
    return findall(prime_indexes)
end

print(resheto(20))

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