require 'pry'
module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        film = array.map do |each_film| #переименовал films_rating_filter в film
          each_film if each_film['country'].to_s.split(',').length >= 2 && each_film['rating_kinopoisk'].to_f.positive?
        end
        film.compact!.reduce(0) { |sum, rating| sum + rating['rating_kinopoisk'].to_f } / film.length
      end

      def chars_count(films, threshold)
        choosen_films = films.map do |film| #Переименовал film_choosen в choosen_films
          film if film['rating_kinopoisk'].to_f >= threshold
        end
        choosen_films.compact.reduce(0) do |sum, each_film|
          sum + each_film['name'].count('и')
        end
      end
    end
  end
end
