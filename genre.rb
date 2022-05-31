class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name, id: rand(1..100_000))
    super()
    @id = id
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end