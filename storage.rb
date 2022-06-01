require 'json'

module Storage
  def read_music
    albums = []
    JSON.parse(File.read(./data/music.json)).each do |music|
      albums.push(Music.new(music['publish_date'], music['on_spotify'], music['archived']))
    end
    albums
  end

    def write_music(musics)
    temp_files = []
    musics.each do |music|
      temp_files.push({
        publish_date: music.publish_date,
        on_spotify: music.on_spotify,
        archived: music.archived
      })
    end
    File.write('./data/music.json', JSON.generate(temp_files).to_s)
  end
end