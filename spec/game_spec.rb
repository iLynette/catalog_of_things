require_relative '../game'

describe Game do
  before :each do
    @game = Game.new(true, '2019', '2011')
  end

  context 'initialize method' do
    it 'instance of Game' do
      expect(@game).to be_an_instance_of Game
    end

    it 'should have multiplayer instance variable' do
      expect(@game.multiplayer).to eq true
    end

    it 'should have last_played_at instance variable' do
      expect(@game.last_played_at.to_s).to eq '2019'
    end
  end

  context 'can_be_archived? method' do
    it 'returns true if parent return true' do
      game = Game.new(true, (Time.now.year - 4), (Time.now.year - 12))
      result = game.send(:can_be_archived?)
      expect(result).to be_truthy
    end
  end
end
