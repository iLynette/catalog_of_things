require 'json'

module Storage
  def read_music
    albums = []
    JSON.parse(File.read(./data/music.json)).each do |music|
      albums.push(Music.new(music['publish_date'], music['on_spotify'], music['archived']))
    end
    albums
  end
end