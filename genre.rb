class Genre
  attr_accessor :name
  attr_reader :item, :id

  def initialize(name, id: rand(1..100_000)){
    super()
    @id = id
    @item = []
    @name = name
  }
end