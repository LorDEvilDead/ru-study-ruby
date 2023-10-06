require "pry"
module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each

      # def my_each(&block)
      #   if block_given?
      #     for element in self do
      #       block.call
      #     end
      #     else
      #       self.to_enum
      #     end
      #   end
      # end

      # def my_each(&block)
      #   if block_given?
      #     if self.empty?
      #       return self
      #     else
      #       a = yield self[0]
      #       self.class.new.drop(1).my_each(&block)
      #     end
      #     self
      #     else
      #       self.to_enum
      #   end
      # end

      def my_each(&block)
        return to_enum unless self.block_given?
        return self if size.zero?

        block.call(first)
        MyArray.new(self[1..]).my_each(&block)
        self
      end

      # 1. нужно условие если есть блок сделай одно, если нет - другое
      # 2. массив может быть? (заполнинный и?)
      # 3. block.call(x)
      # [1,2,3,4]
      #  0 1 2 3
      # a.my_each do |x|
      #   puts x * 2
      # end

      # Написать свою функцию my_map
      def my_map
        0
      end

      # Написать свою функцию my_compact
      def my_compact
        0
      end

      # Написать свою функцию my_reduce
      def my_reduce(accum = nil, &block)
        return accum if self.length == 0
        if accum == nil 
          accum = self[0]
        else
          accum = yield(accum, self[0])
        end
        MyArray.new(self[1..]).my_reduce(accum, &block)
      end
    end
  end
end
# 1. проверяем есть ли блок, если нет - то вызываем ексепшн
# 2. проверяем пустой ли массив - если да - возвращаем значение аккумулятора
# если и аккумулятор пустой - возвращаем нил

# 2. с блоком и без определения аккумулятора
# 3. И блок с определением аккумулятора