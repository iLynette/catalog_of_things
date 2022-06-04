require_relative './source'
require_relative './item'

describe Source do
  before :all do
    @source = Source.new('HBO')
    @item = Item.new(2021)
  end
end