module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_average = array.map do |film_two_countries|
          film_two_countries['rating_kinopoisk'] if film_two_countries['country'].to_s.include?(',') && film_two_countries['rating_kinopoisk'].to_f.positive?
        end
        films_average.compact!.reduce(0) { |sum, each_average| sum + each_average.to_f } / films_average.length
      end

      def chars_count(films, threshold)
        films_average = films.map do |film_two_countries|
          film_two_countries['name'] if film_two_countries['rating_kinopoisk'].to_f >= threshold
        end
        films_average.compact!.join.count 'и'
      end
    end
  end
end
