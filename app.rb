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
end