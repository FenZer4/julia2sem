#Факторизаиця
function factorize(n::IntType) where IntType <: Integer
    list = NamedTuple{(:div, :deg), Tuple{IntType, IntType}}[]
    for p in resheto(Int(ceil(n/2)))
        k = degree(n, p) 
        if k > 0
            push!(list, (div=p, deg=k))
        end
    end
    return list
end

function degree(n, p) 
    k=0
    n, r = divrem(n,p)
    while n > 0 && r == 0
        k += 1
        n, r = divrem(n,p)
    end
    return k
end

print(factorize(450))

"""Простые делители числа и их кратности"""
function divsAndTheirMultiple(n::Integer)
    primes = eratosphen(n)
    divs = []
    multiples = []
    for d in primes
        if n % d == 0
            push!(divs, d)
            push!(multiples, 0)
            while n%d==0
                n /= d
                multiples[length(multiples)] += 1 
            end
        end
    end
    return primes, multiples
end

