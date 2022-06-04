class Source
  attr_accessor :name
  attr_reader :item
  def initialize(name)
    super()
    @name = name
    @item = []
  end

  
end