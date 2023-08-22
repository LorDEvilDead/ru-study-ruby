module Exercise
  module Arrays
    class << self
      def replace(array)
        array_max = array.max
        array.map do |a| 
          if a>0 
            a = array_max
          else
            a
          end
        end
      end

      def search(_array, _query)
        0
      end
    end
  end
end

