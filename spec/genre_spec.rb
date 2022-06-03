require_relative '../genre'
require_relative '../item'

describe Genre do
  before :all do
    @genre = Genre.new 'hip-hop'
    @item = Item.new 1998
  end
end