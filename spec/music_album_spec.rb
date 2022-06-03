require_relative '../music_album'

describe MusicAlbum do
  before :all do
    @music_album = MusicAlbum.new('rap', 2001)
  end

  it 'should be an instance of MusicAlbum class' do
    expect(@music_album).to be_instance_of MusicAlbum
  end

  it 'Album genre should be rap' do
    expect(@music_album.name).to eql 'rap'
  end

  it 'Album on spotify should be false' do
    expect(@music_album.on_spotify).to be_falsy
  end

  it 'Album archived should be false' do
    expect(@music_album.archived).to be_falsy
  end
end