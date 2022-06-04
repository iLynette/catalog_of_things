require_relative '../movie'

describe Movie do
  before :all do
    @movie = Movie.new('Morbius', 2021)
  end

  it 'should be an instance of class Movie' do
    expect(@movie).to be_instance_of Movie
  end
end