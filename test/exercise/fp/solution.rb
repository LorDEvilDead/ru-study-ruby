module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        films_average = _array.map do |film_two_countries| 
          if film_two_countries["country"].to_s.include?(",") && film_two_countries["rating_kinopoisk"].to_f > 0
            film_two_countries["rating_kinopoisk"]
          end 
        end
        films_average.compact!.reduce(0) {|sum, each_average| sum + each_average.to_f} / films_average.length 
      end

      def chars_count(_films, _threshold)
        films_average = _films.map do |film_two_countries|
        if film_two_countries["rating_kinopoisk"].to_f >= _threshold
          film_two_countries["name"]
          end
        end
        films_average.compact!.join.count 'и'
      end
    end
  end
end
