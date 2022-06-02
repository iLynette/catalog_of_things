require './music_album'
require './genre'

module GenreMusic
  def genre_store
    [
      { name: 'Afropop' },
      { name: 'Bollywood music' },
      { name: 'Amapiano' },
      { name: 'Afro-jazz' },
      { name: 'Pop' },
      { name: 'RnB' },
      { name: 'Gospel' },
      { name: 'Electronic' },
      { name: 'Rock' },
      { name: 'Uk Hip-hop' },
      { name: 'Roots' },
      { name: 'Reggae' },
      { name: 'Classics' }
    ]
  end

  def list_genres
    puts 'Available genres'
    puts
    @genre.each_with_index do |genre, i|
      puts "#{i + 1}) #{genre.name}"
    end
  end

  def list_music_albums
    albums = read_music
    if albums.empty?
      puts read_music
      puts 'Please add music album first!!'
    else
      albums.each do |music|
        puts
        puts "Album name: #{music.name}"
        puts "publish year: #{music.publish_date}"
        puts "Available on spotify: #{music.on_spotify}"
        puts "Archive state: #{music.archived}"
        puts
      end
    end
  end

  def add_publish_date
    print 'Publish Date(eg 2004): '
    publish_date = gets.chomp
    publish_date.empty? ? add_publish_date : publish_date
  end

  def add_on_spotify
    print 'is it on spotify?[Y/N]: '
    spotify = gets.chomp
    %w[Y N].include?(spotify.capitalize) ? spotify.capitalize : add_on_spotify
  end

  def create_archived
    print 'is the music archived?[Y/N]: '
    music_archived = gets.chomp
    %w[Y N].include?(music_archived.capitalize) ? music_archived.capitalize : create_archived
  end

  def add_genre
    puts 'Please select a music Genre!!'
    puts
    @genre.each_with_index do |genre, i|
      puts "#{i + 1}) #{genre.name}"
    end
    puts
    print 'Please select genre: '
    genre_num = gets.chomp
    indx = genre_num.to_i - 1
    genre_name = nil

    @genre.each_with_index do |genre, i|
      if indx == i
        genre_name = genre.name
      else
        genre_name
      end
    end
    genre_name
  end

  def music_album_info
    name = add_genre
    publish_date = add_publish_date
    on_spotify = add_on_spotify == 'Y'
    archived = create_archived == 'Y'
    [name, publish_date, on_spotify, archived]
  end

  def create_album
    name, publish_date, on_spotify, archived = music_album_info
    music = MusicAlbum.new(name, on_spotify, publish_date, archived)
    music_genre = { album_name: music.name, on_spotify: music.on_spotify, publish_date: music.publish_date,
                    archived: music.archived }
    @music_album << music_genre
    write_music(@music_album)
  end
end
