require_relative '../genre'
require_relative '../item'

describe Genre do
  before :all do
    @genre = Genre.new 'hip-hop'
    @item = Item.new 1998
  end

  it 'Items should be empty' do
    expect(@genre.items).to be_empty
  end

  it 'should return hip-hop' do
    expect(@genre.name).to eql 'hip-hop'
  end
end