require 'json'
require_relative '../game.rb'

module GamesModule
    def load_games
        data = []
        file = './data/games.json'
        if File.exist?(file)
            JSON.parse(File.read(file)).each do |games|
                data.push(Game.new(games['multiplayer'], games['last_played_at'], games['publish_date']))
            end
        else
            File.write(file, [])
        end
        data
    end

    def create_games
        data = []
        @games.each do |game|
            data.push({multiplayer: game.multiplayer, publish_date: game.publish_date,
                last_played_at: game.last_played_at})
        end
        File.write('./data/games.json', JSON.generate(data))
    end
end