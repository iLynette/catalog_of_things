require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, archieved)
    super(publish_date, archieved)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  private

  def can_be_archived?
    diff = Date.now.year - @last_played_at.year
    return true if super() && diff > 2

    false
  end
end
