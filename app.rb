require './book'
require './game'
require './author'
require './item'
require './label'
require './music_album'
require './genre'

class App
  attr_accessor :user_input

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
    8 List all sources
    9 Add a book
    10 Add a music album
    11 Add a movie
    12 Add a game
    13 exit app
    '
    puts ' '
    puts 'select an option: '
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
    when '8'
      list_sources
    end
  end

  def create_things(user_input)
    case user_input
    when '9'
      create_book
    when '10'
      create_album
    when '11'
      create_movie
    when '12'
      create_game
    end
  end

  def run
    loop do
      case user_input
      when '1', '2', '3', '4,'
        display_list_a(user_input)
      when '5', '6', '7', '8'
        display_list_b(user_input)
      when '9', '10', '11', '12'
        create_things(user_input)
      when '13'
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
