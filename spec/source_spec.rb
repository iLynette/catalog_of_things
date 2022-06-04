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
  end
end