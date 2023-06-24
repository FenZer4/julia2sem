#Расширенный алгоритм Евклида с коэффициентами
function extended_gcd(a::T,b::T) where T<:Integer 
    u, v = one(T), zero(T); u1, v1 = 0, 1
    while b != 0        # Инвариант
        r, k = a % b, div(a, b)
        a, b = b, r
        u, v, u1, v1 = u1, v1, u - k * u1, v - k * v1
    end
    if a < 0
        a, u, v = -a, -u, -v
    end
    return a, u, v
end

print(extended_gcd(14,29))

"""
d = um - vn

Идея расширенного алгоритма Евклида заключается в том, что на любом шаге алгоритма хранятся коэффициенты, выражающие текущие числа
a и b через исходные числа m и n.

В алгоритме учавствую a,b,x,y,_x,_y
Инвариант I: НОД(a,b) = НОД(m,n)
a =  um  +  vn
b = u1m +   v1n

Начальные значения этих переменных обеспечивают  выполнения инварианта:
a = m,  b = n
u = 1   v = 0
u1 = 0  v1 = 1

b = 0 условие завершения цикла

r = a - qb = (um - vn) - k(u1m - v1n) = (u - qu1)m + (v - kv1)n
"""