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

        arr = MyArray.new
        my_reduce(arr) { |accum, element| accum << yield(element) }
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
      # Я как действующий тестировщик, подошёл сразу к создаию этого метода не совсем корректно
      # Я начал смотреть сразу кейсы, которые могут вызывать ошибки в работе метода или кейсы, которые могут привести к некорректной работе, чтобы их ограничить
      # в следствии нашёл один кейс, который хотел реализовать - но остановился, в следствии чего появился вопрос:
      # такие кейсы были обнаружены:
      # [].reduce  [].reduce() [].reduce(){}  => nil
      # [].reduce(1) => error
      # [1,2,3].reduce(1)(без акума и с пустым акумом) => error
      # [].reduce(1){} => 1 почему в этом кейсе 1, а на пару строк выше эрор, а в первой строке нил?
      # [1,2,3].reduce(1){} => И почему тут тоже 1?
    end
  end
end
