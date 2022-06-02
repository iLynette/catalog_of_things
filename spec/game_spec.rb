require_relative '../game.rb'

describe Game do
    before :each do
        @game = Game.new(true, '2019', '2011', false)
    end

    context 'initialize method' do
        it 'instance of Game' do
            expect(@game).to be_an_instance_of Game
        end
        it 'should have multiplayer instance variable' do
            expect(@game.multiplayer).to eq true
        end
    end
end