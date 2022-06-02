require './book'
require './item'

describe Book do
  before :each do
    @book = Book.new 'Publisher', 'Cover state', 'Publish date'
  end
end
