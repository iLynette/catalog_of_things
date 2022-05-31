class Item
  attr_accessor :publish_date
  attr_reader :archived, :id, :genre, :label, :author

  def initialize(archived:false, publish_date, id: Random.rand(1..1000))
    super()
    @id = id
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