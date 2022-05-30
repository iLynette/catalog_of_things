class Genre < Item
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name)
    super(archived:false, publish_date, id)
    @items = []
    @id = id.Random.rand(1..1000)
    @name = name
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end