require './music_album'
require './genre'

module GenreMusic
  def genre_store
    [
      { name: 'Afropop' },
      { name: 'Manga comics' },
      { name: 'Bollywood music' },
      { name: 'Bollywood movies' },
      { name: 'Thriller' },
      { name: 'Amapiano' },
      { name: 'Comedy' },
      { name: 'Afro-jazz' },
      { name: 'Afro-cinema' },
      { name: 'Pop' },
      { name: 'Documentary' },
      { name: 'Religious Books' },
      { name: 'RnB' },
      { name: 'Romance' },
      { name: 'Gospel' },
      { name: 'Electronic' },
      { name: 'Non-fiction' },
      { name: 'Self-help books' },
      { name: 'Fiction' }
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
      puts
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

  def add_album_name
    print 'Album Name: '
    name = gets.chomp
    name.empty? ? add_album_name : name
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

  def music_album_info
    name = add_album_name
    publish_date = add_publish_date
    on_spotify = add_on_spotify == 'Y'
    archived = create_archived == 'Y'
    [name, publish_date, on_spotify, archived]
  end

  def create_album
    name, publish_date, on_spotify, archived = music_album_info
    music = MusicAlbum.new(name, on_spotify, publish_date, archived)
    @music_album << music
    write_music(@music_album)
  end
end
