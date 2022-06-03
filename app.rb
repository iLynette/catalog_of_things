require './book'
require './game'
require './author'
require './item'
require './label'
require './music_album'
require './genre'
require './book_list'
require './modules/authors_module.rb'
require './modules/games_module.rb'
require './operations/game_manager.rb'
require './operations/author_manager.rb'

class App
  include GamesModule
  include AuthorsModule

  attr_accessor :user_input

  def initialize
    puts 'Welcome to the Catalog of Things App!'
    prompt
    @books = Booklist.new
    @music_album = []
    @movies = []
    @games = load_games
    @genre = []
    @labels = []
    @authors = load_authors
    @user_input = gets.chomp
  end

  def save_data
    add_game
    create_games
  end

  def prompt
    puts '
    1 List all books
    2 List all music albums
    3 List of games
    4 List all genres
    5 List all labels
    6 List all authors
    7 Add a book
    8 Add a music album
    9 Add a game
    10 exit app
    '
    puts ' '
    puts 'select an option: '
  end

  def display_list_a(user_input)
    case user_input
    when '1'
      @books.list_all_books
    when '2'
      list_music_albums
    when '3'
      list_games
    end
  end

  def display_list_b(user_input)
    case user_input
    when '4'
      list_genres
    when '5'
      @books.list_labels
    when '6'
      list_authors
    end
  end

  def create_things(user_input)
    case user_input
    when '7'
      @books.add_book
    when '8'
      create_album
    when '9'
      save_data
    end
  end

  def run
    loop do
      case user_input
      when '1', '2', '3'
        display_list_a(user_input)
      when '4', '5', '6'
        display_list_b(user_input)
      when '7', '8', '9'
        create_things(user_input)
      when '10'
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
