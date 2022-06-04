class Source
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    super()
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.add_source = self
  end
end