require_relative './item'
require 'date'

class Movie < Item
  attr_accessor :silet, :movie_name

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(movie_name, publish_date, silet = false, archived = false)
    super(publish_date, archived)
    @silet = silet
    @movie_name = movie_name
  end

  # rubocop:enable Style/OptionalBooleanParameter
  private

  def can_be_archived
    super && silet
  end
end
