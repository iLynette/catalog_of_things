require_relative '../source'
require_relative '../item'

describe Source do
  before :all do
    @source = Source.new('HBO')
    @item = Item.new(2021)
  end

  context 'Class Object instance' do
    it 'source should be an instance of class Source' do
      expect(@source).to be_instance_of Source
    end

    it 'Item should be an empty' do
      expect(@source.items).to be_empty
    end

    it 'should return HBO' do
      expect(@source.name).to eql 'HBO'
    end
  end

  context 'Add item to source' do
    it 'Source item length should be == 1 after item is added' do
      @source.add_item(@item)
      expect(@source.items.length).to eq 1
    end

    it 'An already existing item should not be added, length of item should still be equal to 1' do
      @source.add_item(@item)
      expect(@source.items.length).to eq 1
    end

    it 'item passed into array should be equal to the item being passed' do
      expect(@item.source). to eql @source
    end
  end
end