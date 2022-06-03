require_relative '../music_album'

describe MusicAlbum do
  before :all do
    @music_album = MusicAlbum.new('rap', 2001)
  end

  it 'should be an instance of MusicAlbum class' do
    expect(@music_album).to be_instance_of MusicAlbum
  end
end