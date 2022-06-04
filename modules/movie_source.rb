module MovieSource
  def source_store
    [
      {name: 'HBO-MAX'},
      {name: 'Netflix'},
      {name: 'Disney+'},
      {name: 'Hulu'},
      {name: 'Paramount+'},
      {name: 'FX'},
      {name: 'Colombia'},
      {name: 'ShowMax'}
    ]
  end

  def list_sources
    puts 'Available movie sources'
    @sources.each_with_index do |src, i|
      pos = i + 1
      puts "#{pos}) #{src.name}"
    end
  end

  def select_genre
    puts 'Please select a movie source!'
    puts
    list_sources
    print 'Select source: '
    num = gets.chomp
    indx = num.to_i - 1
    movie_source = nil
    @sources.each_with_index do |genre, i|
      if indx == i
        movie_source = genre_name
      else
        select_genre
      end
    end 
    movie_source
  end
end