require_relative '../game.rb'
require_relative '../item.rb'

def list_games
    puts 'Games: '
    @games.each do |game|
        puts "Multiplayer: #{game.multiplayer}, Publish Date: #{game.publish_date},
        Last played date: #{game.last_played_at}"
    end
end

def add_game
    puts 'Please write multiplayer'
    multiplayer = gets.chomp

    puts 'Please write date of publish: [Only year]'
    publish_date = gets.chomp

    puts 'Please write last played date [Only year]'
    last_played_at = gets.chomp

    @games.push(Game.new(multiplayer, last_played_at, publish_date))
    puts 'Game is created'
end

