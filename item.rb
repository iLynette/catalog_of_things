class Item
  attr_accessor :publish_date
  attr_reader :archived, :id, :genre, :label, :author

  def initialize(publish_date, archived: false, id: rand(1..100_000))
    super()
    @id = id
    @archived = archived
    @publish_date = publish_date
    @label = nil
  end

  def author(author)
    @author = author
    @author.add_item(self) unless @author.items_list.include?(self)
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
