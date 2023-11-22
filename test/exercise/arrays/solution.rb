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

      def search(array, query, low = 0, high = array.length - 1)
        return -1 if low > high || query < array[low] || query > array[high]

        mid = (low + high) / 2
        return mid if array[mid] == query

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end
    end
  end
end
