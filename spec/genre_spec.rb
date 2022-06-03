require_relative '../genre'
require_relative '../item'

describe Genre do
  before :all do
    @genre = Genre.new('hip-hop')
    @item = Item.new(1998)
  end

  context 'Class Object' do
    it 'genre should be an instance of class Genre' do
      expect(@genre).to be_instance_of Genre
    end

    it 'Items should be empty' do
      expect(@genre.items).to be_empty
    end

    it 'should return hip-hop' do
      expect(@genre.name).to eql 'hip-hop'
    end
  end

  context 'Add an item to genre' do
    it 'Genre item length should be == 1 after item is add' do
      @genre.add_item(@item)
      expect(@genre.items.length).to eq 1
    end

    it 'an already existing item should not be added, length of item should still be ==1' do
      @genre.add_item(@item)
      expect(@genre.items.length).to eq 1
    end

    it 'item passed into array should equal to the genre item being passed' do
      expect(@item.genre).to eql @genre
    end
  end
end