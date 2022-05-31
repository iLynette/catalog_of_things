require './book'
require './item'

describe Book do
  before :each do
    @book = Book.new 'Publisher', 'Cover state', 'Publish date'
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#publisher' do
    it 'detects the right publisher' do
      expect(@book.publisher).to eq 'Publisher'
    end
  end

  describe '#cover_state' do
    it 'detects the right cover_state' do
      expect(@book.cover_state).to eq 'Cover state'
    end
  end
end
