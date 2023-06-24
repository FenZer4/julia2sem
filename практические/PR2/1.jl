function power(base, exp)
    if exp == 0
        return 1
    elseif exp == 1
        return base
    else
        temp = power(base, div(exp, 2))
        if isodd(exp)
            return base * temp * temp
        else
            return temp * temp
        end
    end
end


print(power(6,3))