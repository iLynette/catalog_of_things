require './label'
require './item'

describe Label do
    before :each do
      @label = Label.new 'Title', 'Color'
    end

    describe '#new' do
    it 'takes two parameters and returns a Label object' do
      @label.should be_an_instance_of Label
    end
  end

  describe '#title' do
    it 'detects the title of lable' do
      expect(@label.title).to eq 'Title'
    end
  end
end