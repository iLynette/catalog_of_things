class Item
  attr_accessor :publish_date
  attr_reader :archived, :id, :genre, :label, :author

  def initialize(archived, publish_date, id)
    super()
    @id = Random.rand(1..1000)
    @archived = archived
    @publish_date = publish_date
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include(self)
  end

  
end