class Source
  attr_accessor :name
  attr_reader :item

  def initialize(name)
    super()
    @name = name
    @item = []
  end

  def add_item(item)
    @item << item unless @item.include? item
    item.add_source = self
  end
end