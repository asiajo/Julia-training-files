include("mergeSort.jl")

using Test

println(         "-------------------------------------------------------------")
println(         "Start testing of the Merge Sort alghoritm...")
@testset         "Merge sort testing-------------------------------------------" begin

        @testset "One element input returns one element output                 " begin
                @test mergeSort([1]) == [1]
        end

        @testset "Sorted input returns sorted output                           " begin
                @test mergeSort([1,2]) == [1,2]
        end

        # merge function as private within mergeSort should probably not be tested.
        @testset "Merge function merge two one element arrays                  " begin
                @test merge([2],[1]) == [1,2]
        end

        @testset "Merge two presorted multiple element same length arrays      " begin
                @test merge([1,4],[2,3]) == [1,2,3,4]
                @test merge([1,4,7],[2,3,6]) == [1,2,3,4,6,7]
        end

        @testset "Merge two presorted multiple element different length arrays " begin
                @test merge([1,4,7],[2,3]) == [1,2,3,4,7]
                @test merge([1,4,7],[2,3,6,9]) == [1,2,3,4,6,7,9]
        end

        @testset "Two element unsorted input returns sorted output             " begin
                @test mergeSort([2,1]) == [1,2]
        end

        @testset "Input multiple elements returns sorted output                " begin
                @test mergeSort([1,3,2]) == [1,2,3]
                @test mergeSort([1,3,7,2]) == [1,2,3,7]
        end

        @testset "Include negative numbers and 0 in input                      " begin
                @test mergeSort([2,1,-7,-5,0]) == [-7,-5,0,1,2]
                @test mergeSort([-1,-3,-2]) == [-3,-2,-1]
        end

        @testset "Include duplicated numbers in input                          " begin
                @test mergeSort([2,1,2,1]) == [1,1,2,2]
                @test mergeSort([-1,-2,-1]) == [-2,-1,-1]
        end

        @testset "Input an empty array expect to receive empty arr             " begin
                @test mergeSort([]) == []
        end

        @testset "Input float expect to sort correctly                         " begin
                @test mergeSort([5.7, 5.2, 4.3, 12.9, 12.0]) == [4.3, 5.2, 5.7, 12.0, 12.9]
        end

        @testset "Input not a number expect to return an empty array           " begin
                @test mergeSort(["b", "a", "c"]) == []
                @test mergeSort(['b','a','c']) == []
                @test mergeSort([3,6,1,2,'a']) == []
                @test mergeSort(['$','%',"*"]) == []
        end

        @testset "No input expect empty output                                 " begin
                @test mergeSort() == []
        end

        @testset "Very big input (>Int128) expect sorted output                " begin
                @test mergeSort([5, -170141183460469231731687303715884105729,170141183460469231731687303715884105728, 9]) == [-170141183460469231731687303715884105729, 5, 9, 170141183460469231731687303715884105728]
        end
end
