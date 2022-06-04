class Movie < Item
  attr_accessor :silet, :movie_name

  def initialize(movie_name, publish_date, silet = false, archived = false)
    super(publish_date, archived)
    @silet = silet
    @movie_name = movie
  end
end