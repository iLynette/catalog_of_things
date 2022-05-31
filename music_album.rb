require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false, archived: false, id: rand(1..100_000))
    super(archived, publish_date, id)
    @on_spotify = on_spotify
  end

  def can_be_archived
    super && on_spotify
  end
end
