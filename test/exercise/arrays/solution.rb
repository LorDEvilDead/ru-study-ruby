require 'pry'
module Exercise
  module Arrays
    class << self

      def my_max(arr)
        max = arr[0]
        arr.each do |num|
          max = num if num > max
        end
        max
      end 

      def replace(array)
        array.map { |number| number.positive? ? my_max(array) : number }
      end
 
      def search(array, query, low=0, high=array.length-1)
        if low > high
          return -1
        else
          mid = (low+high)/2
        if  query < array[mid]
          search(array, query, mid-1, high=mid)
        elsif query > array[mid]
          search(array, query, mid+1, low=array[mid])
        else
          return mid
        end
      end
    end
  end
end
[1,2,3,4,5,6,7]
# def search(array, query)
# low = 0
# high = array.length-1
# result = -1
# while low <= high
#   mid = (low+high)/2
#   if query == array[mid]
#     result = mid
#     break
#   end
#   if query > array[mid]
#    low = mid + 1
#   end
#   if query < array[mid]
#     high = mid - 1
#   end
# end
# return result
              

   



