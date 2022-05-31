class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name)
    @items = []
    @id = id.Random.rand(1..1000)
    @name = name
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end