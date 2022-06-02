require_relative '../author.rb'

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
end