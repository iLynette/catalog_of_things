require_relative '../author.rb'
require_relative '../item.rb'

describe Author do
    before :each do
        @author = Author.new('Tufahel', 'Ahmed')
    end

    context 'initialize method' do
        it 'author should be an instance of Author' do
            expect(@author).to be_an_instance_of Author
        end

        it 'should have a first_name instance variable' do
            name = @author.first_name
            expect(name).to eq 'Tufahel'
        end

        it 'should have a last_name instance variable' do
            name = @author.last_name
            expect(name).to eq 'Ahmed'
        end
    end

    context 'add item' do
        it 'should add an item' do
            author = Author.new('Tufahel', 'Ahmed')
            item = Item.new('2021', false)
            author.add_item(item)
            expect(author.items). to include(item)
            expect(item.author).to be(author)
        end
    end
end