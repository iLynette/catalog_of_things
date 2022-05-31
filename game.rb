require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, id: rand(1..1000))
    super(publish_date, id: id)
    @id = id
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    diff = Time.now.year - @last_played_at
    return true if super() && diff > 2

    false
  end
end
