require_relative '../movie'

module MovieSource
  def source_store
    [
      { name: 'HBO-MAX' },
      { name: 'Netflix' },
      { name: 'Disney+' },
      { name: 'Hulu' },
      { name: 'Paramount+' },
      { name: 'FX' },
      { name: 'Colombia' },
      { name: 'ShowMax' }
    ]
  end

  def list_sources
    puts 'Available movie sources'
    @sources.each_with_index do |src, i|
      pos = i + 1
      puts "#{pos}) #{src.name}"
    end
  end

  def select_source
    puts 'Please select a movie source!'
    puts
    list_sources
    print 'Select source: '
    num = gets.chomp
    indx = num.to_i - 1
    movie_source = nil
    @sources.each_with_index do |src, i|
      if indx == i
        movie_source = src.name
      else
        movie_source
      end
    end
    movie_source
  end

  def movie_publish_date
    print 'Publish date(eg. 2001): '
    date = gets.chomp
    date.empty? ? movie_publish_date : date
  end

  def add_silet
    print 'is it silet[Y/N]: '
    silet = gets.chomp
    %w[Y N].include?(silet.capitalize) ? silet.capitalize : silet
  end

  def add_movie_archived
    print 'is the movie Archived?[Y/N]: '
    archived = gets.chomp
    %w[Y N].include?(archived.capitalize) ? archived.capitalize : archived
  end

  def movie_info
    movie_name = select_source
    publish_date = movie_publish_date
    silet = add_silet == 'Y'
    archived = add_movie_archived == 'Y'
    [movie_name, publish_date, silet, archived]
  end

  def create_movie
    movie_name, publish_date, silet, archived = movie_info
    movie = Movie.new(movie_name, publish_date, silet, archived)
    @movies << movie
    write_movies(@movies)
  end

  def list_movies
    movies = read_movie
    if movies.empty?
      puts 'Please Add movies first'
    else
      movies.each do |movie|
        puts "Movie source: #{movie.movie_name}"
        puts "Publish year: #{movie.publish_date}"
        puts "Movie silet: #{movie.silet}"
        puts "Archive state: #{movie.archived}"
      end
    end
  end
end
