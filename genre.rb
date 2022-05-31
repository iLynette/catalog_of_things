class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name, id: Random.rand(1..1000))
    super()
    @items = []
    @id = id
    @name = name
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end