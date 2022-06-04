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
    movies_temp = []
    movies.each do |movie|
      movies_temp.push({
        movie_name: movie.movie_name,
        publish_date: movie.publish_date,
        silet: movie.silet,
        archived: movie.archived
      })
    end
    File.write('./data/movies.json', JSON.generate(movies_temp).to_s)
    puts 'Movie successfully added'
  end
end