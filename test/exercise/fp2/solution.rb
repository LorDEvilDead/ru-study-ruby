require 'pry'
module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return to_enum unless block_given?
        return self if size.zero?

        block.call(first)
        MyArray.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        return to_enum unless block_given?

        my_reduce(MyArray.new) { |accum, element| accum << yield(element) }
        arr
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |accum, element|
          accum << element unless element.nil?
          accum
        end
      end


      # Написать свою функцию my_reduce
      def my_reduce(accum = nil, &block)
        return accum if empty?

        accum = accum.nil? ? self[0] : yield(accum, self[0])

        MyArray.new(self[1..]).my_reduce(accum, &block)
      end
    end
  end
end
