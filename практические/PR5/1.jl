"""
    mysort!(array)

Сортирует массив `array` методом сортировки вставками.
"""
function mysort!(array)
    for i in 2:length(array)
        j = i
        while j > 1 && array[j] < array[j-1]
            array[j-1], array[j] = array[j], array[j-1]
            j -= 1
        end
    end
    return array
end

"""
    mysort(array)

Возвращает новый массив, полученный из массива `array` путем сортировки его методом сортировки вставками.
"""
function mysort(array)
    return mysort!([x for x in array])
end

"""
    mysortperm(array)

Возвращает индексы элементов массива `array`, чтобы они были отсортированы методом сортировки вставками.
"""
function mysortperm(array)
    perm = [x for x in 1:length(array)]
    for i in 2:length(array)
        j = i
        while j > 1 && array[perm[j]] < array[perm[j-1]]
            perm[j-1], perm[j] = perm[j], perm[j-1]
            j -= 1
        end
    end
    return perm
end

"""
    mysortperm!(perm, array)

Возвращает индексы элементов массива `array`, чтобы они были отсортированы методом сортировки вставками. Результат сохраняется в массиве `perm`.
"""
function mysortperm!(perm, array)
    for i in 2:length(array)
        j = i
        while j > 1 && array[perm[j]] < array[perm[j-1]]
            perm[j-1], perm[j] = perm[j], perm[j-1]
            j -= 1
        end
    end
    return perm
end
