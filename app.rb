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
    puts 'Welcome to the catalog of things app'
    prompt
    @books = []
    @music_album = []
    @movies = []
    @games = []
    @genre = []
    @labels = []
    @authors =[]
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
end