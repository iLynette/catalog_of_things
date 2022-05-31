class Item
  attr_accessor :publish_date
  attr_reader :archived, :id, :genre, :label, :author

  def initialize(publish_date, archived: false, id: nill)
    super()
    @id = id || Random.rand(1..1000)
    @archived = archived
    @publish_date = publish_date
  end

  def move_to_archive
    @archived && can_be_archived
  end

  def can_be_archived?
    now = Time.now.year
    years = now - publish_date
    years > 10
  end
end
