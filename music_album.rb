require './item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(name, on_spotify, publish_date, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @name = name
  end

  private
  def can_be_archived
    super && on_spotify
  end
end
