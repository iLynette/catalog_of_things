require 'json'

module Storage
  def read_music
    albums = []
    JSON.parse(File.read())
  end
end