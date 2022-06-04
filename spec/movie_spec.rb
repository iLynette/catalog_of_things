require_relative '../movie'

describe Movie do
  before :all do
    @movie = Movie.new('Morbius', 2021)
  end

  it 'should be an instance of class Movie' do
    expect(@movie).to be_instance_of Movie
  end

  it 'should return false on silet' do
    expect(@movie.silet).to be_falsy
  end

  it 'should return Morbius as movie name' do
    expect(@movie.movie_name).to eql 'Morbius'
  end
end
