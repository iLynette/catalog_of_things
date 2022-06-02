require 'json'
require './music_album'

module Storage
  def read_music
    albums = []
    JSON.parse(File.read('./data/music.json')).each do |music|
      albums.push(MusicAlbum.new(music['album_name'], music['on_spotify'], music['publish_date'], music['archived']))
    end
    albums
  end

  def write_music(musics)
    temp_files = []
    musics.each do |music|
      temp_files.push({
                        album_genre: music[:album_name],
                        publish_date: music[:publish_date],
                        on_spotify: music[:on_spotify],
                        archived: music[:archived],
                      })
    end
    File.write('./data/music.json', JSON.generate(temp_files).to_s)
    puts 'Music Album created successfully'
  end
end
