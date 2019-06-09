function mergeSort()
        return []
end

function mergeSort(arr::Vector)
        # make sure that all elements of an array are proper numeric value
        for elem in arr
                if(!isa(elem, Number))
                        return[]
                end
        end
        mergeSortNums(arr)
end

function mergeSortNums(arr::Vector)

        #one element array is a soted array
        #empty input returns also an empty output
        if(size(arr)[1] <= 1)
                return arr
        end

        mid = trunc(Int, size(arr)[1]/2)
        l1 = arr[1:mid]
        l2 = arr[mid+1:size(arr)[1]]

        l1 = mergeSortNums(l1)
        l2 = mergeSortNums(l2)

        return merge(l1, l2)
end

function merge(l1::Vector, l2::Vector)

        l_tmp = []

        while(size(l1)[1] !=0 && size(l2)[1]!=0)
                if(l2[1] < l1[1])
                        append!(l_tmp, l2[1])
                        deleteat!(l2, 1)
                else
                        append!(l_tmp, l1[1])
                        deleteat!(l1,1)
                end
        end

        while(size(l1)[1] != 0)
                append!(l_tmp, l1[1])
                deleteat!(l1, 1)
        end

        while(size(l2)[1] != 0)
                append!(l_tmp, l2[1])
                deleteat!(l2, 1)
        end

        return l_tmp

end
