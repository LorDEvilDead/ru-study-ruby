require 'pry'
module Exercise
  module Arrays
    class << self
<<<<<<< HEAD
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

      def search(array, query, low = 0, high = array.length - 1)
        return -1 if low > high || query < array[low] || query > array[high]

        mid = (low + high) / 2
        return mid if array[mid] == query

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
=======
      def replace(array)
        array_max = array.max
        array.map { |array_element| array_element.positive? ? array_max : array_element }
      end

      def search(array, query)
        array.each do |index_array|
          return array.index(index_array) if index_array == query
        end
        -1
>>>>>>> 1f1e41a (i will return to this)
      end
    end
  end
end
