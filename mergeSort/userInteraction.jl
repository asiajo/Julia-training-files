include("mergeSort.jl")

function welcome()
        println("-------------------------------------------------------------")
        println("Welcome to Sort merge algorithm in Julia.")
        println("Algorithm works for numbers only.")
        whatToDo()
end

function whatToDo()
        println("")
        println("What would you like to do next? Press correct number:")
        println("1. See trivial examples")
        println("2. See advanced example")
        println("3. Sort your own array")
        println("4. Run the test cases")
        println("9. Exit")
        repeat = true
        while repeat
                inp = readline()
                # no switch/case in julia
                if inp == "1"
                         trivialExamples()
                         repeat = false
                elseif inp == "2"
                        complicatedExample()
                        repeat = false
                elseif inp == "3"
                        sortFromUser()
                        repeat = false
                elseif inp == "4"
                        include("mergeSortTest.jl")
                        whatToDo()
                        repeat = false
                elseif inp == "9"
                        println("Goodbye!")
                        repeat = false
                else
                        println("You need to write 1, 2, 3, 4 or 9")
                end
        end

end

function trivialExamples()
        println("This are trivial examples of the merge sort function:")
        println("If we call a function with no elements:")
        println("We receive:", mergeSort())
        println("If we call a function with one element: mergeSort([1])")
        println("We receive:", mergeSort([1]))
        println("If we call a function with two elements: mergeSort([2,1])")
        println("The alghoritm creates two subarrays from the given one:")
        println("[2] and [1]")
        println("Than merge function is called for those two elements")
        println("And it returns:", merge([2],[1]))
        whatToDo()
end

function complicatedExample()

        println("This is an advanced example of the merge sort function:")
        println("We call it with unsorted array, for ex:")
        arr = [14,4,3,2,1,15,7,9,12,11,6,10,8,5,16,13]
        println(arr)
        println("The alghoritm creates two subarrays from the given one:")
        println("[14,4,3,2,1,15,7,9] and [12,11,6,10,8,5,16,13]")
        println("Than for each new array it calls itself recursively")
        println("until all the arrays are one element arrays:")
        println("[14],[4],[3],[2],[1],[15],[7],[9],[12],[11],[6],[10],[8],[5],[16],[13]")
        println("Than merge function is called for each two elements")
        println("two first calls to that function return:")
        println("[4,14] and [2,3]")
        println("than merge function is called on those two arrays creating:")
        println("[2,3,4,14] and from two next pairs: [1,7,9,15]" )
        println("merge function is called repetively until the whole array is sorted:")
        println(mergeSort(arr))
        whatToDo()
end

function sortFromUser()
        println("Now it is your turn. Give an array to be sorted.")
        println("Numbers should be separated by spaces and in range [-9_223_372_036_854_775_808, 9_223_372_036_854_775_807]:")
        inp = readline()
        givenArr = convertToArray(inp)
        println("The resulting array is:")
        println(mergeSort(givenArr))
        whatToDo()
end

function convertToArray(inp)
        output = []
        try
                println("converting..")
                for ss in split(inp)
                        num = parse(Int, ss)
                        append!(output, num)
                end
        catch
                println("The input must be a number arrray separated by spaces")
        end

        return output
end
