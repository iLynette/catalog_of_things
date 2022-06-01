class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    super()
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.add_genre = self
  end
end
