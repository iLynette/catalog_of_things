require './item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, publish_date, on_spotify = false, archived = false)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @name = name
  end

  # rubocop:enable Style/OptionalBooleanParameter
  private

  def can_be_archived
    super && on_spotify
  end
end
