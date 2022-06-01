require './book'
require './game'
require './author'
require './item'
require './label'
require './music_album'
require './genre'
require './storage.rb'

class App
  attr_accessor :user_input

include Storage

  def initialize
    puts 'Welcome to the Catalog of Things App!'
    prompt
    @books = []
    @music_album = []
    @movies = []
    @games = []
    @genre = []
    @labels = []
    @authors = []
    @user_input = gets.chomp

    genre_store.each do |item|
      genre = Genre.new(item[:name])
      @genre << genre
    end
  end

  def prompt
    puts '
    1 List all books
    2 List all music albums
    3 List all movies
    4 List of games
    5 List all genres
    6 List all labels
    7 List all authors
    8 Add a book
    9 Add a music album
    10 Add a movie
    11 Add a game
    12 exit app
    '
    puts ' '
    puts 'select an option: '
  end

  def genre_store
    [
      {name: 'Afropop'},
      {name: 'kenyan'},
      {name: 'Bollywood'},
      {name: 'Lingala'},
      {name: 'Amapiano'},
      {name: 'benga'},
      {name: 'Bongo'},
      {name: 'Afro-jazz'},
      {name: 'Hip-hop'},
      {name: 'world Pop'},
      {name: 'world Jazz'},
      {name: 'country'},
      {name: 'RnB'},
      {name: 'Rock'},
      {name: 'Gospel'},
      {name: 'Electronic'},
      {name: 'k-pop'}
    ]
  end

  def list_genres
    puts 'Available genres'
    puts
    @genre.each_with_index do |genre, i|
      puts "#{i +1}) #{genre.name}"
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
    publish_date, on_spotify, archived = music_album_info
    music = MusicAlbum.new(name, on_spotify, publish_date, archived)
    @music_album << music
    write_music(@music_album)
  end

  def display_list_a(user_input)
    case user_input
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_movies
    when '4'
      list_games
    end
  end

  def display_list_b(user_input)
    case user_input
    when '5'
      list_genres
    when '6'
      list_lables
    when '7'
      list authors
    end
  end

  def create_things(user_input)
    case user_input
    when '8'
      create_book
    when '9'
      create_album
    when '10'
      create_movie
    when '11'
      create_game
    end
  end

  def run
    loop do
      case user_input
      when '1', '2', '3', '4'
        display_list_a(user_input)
      when '5', '6', '7'
        display_list_b(user_input)
      when '8', '9', '10', '11'
        create_things(user_input)
      when '12'
        puts 'Thank you for using the catalog of things app'
        exit(true)
      else
        puts "\nWrong Input \"#{user_input}\"!"
        puts 'Please try these available inputs'
        prompt
        @user_input = gets.chomp
        run
      end
      prompt
      @user_input = gets.chomp
    end
  end
end
