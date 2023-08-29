module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
    
      def my_each 
        if block_given?
          arr = []
          for element in arr do
            block.call
            else
              <Enumerator:... :my_each>
            end
          end
        end  
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
      def my_reduce 
      0
      end
    end
  end
end
