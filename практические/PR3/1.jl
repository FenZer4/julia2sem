#Является ли число n простым
function isPrime(n)

    for i in 2:sqrt(n)
        if n % i == 0
            return false
        end
    end
    return true
end

print(isPrime(103))


"""Проверка на простоту"""
function isprime_(n::T)::Bool where T <: Integer
    for i in 2:round(T, sqrt(n))
        if n % i == 0
            return false
        end
    end
    return true
end