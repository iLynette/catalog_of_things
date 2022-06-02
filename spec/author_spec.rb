require_relative '../author.rb'

describe Author do
    before :each do
        @author = Author.new('Tufahel', 'Ahmed')
    end

    context 'initialize method' do
        it 'author should be an instance of Author' do
            expect(@author).to be_an_instance_of Author
        end
    end
end