require_relative '../movie.rb'

module MovieStorage
  def read_movie
    movies = []
    if File.zero?('./data/movies.json')
      print ''
    else
      JSON.parse(File.read('./data/movies.json')).each do |movie|
        movies.push(Movie.new(movie['movie_name'], movie['publish_date'], movie['silet'], movie['archived']))
      end
    end
    movies
  end

  def write_movies(movies)
  end
end