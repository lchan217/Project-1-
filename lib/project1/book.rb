class Genre
  attr_accessor :winner, :genre, :url
  @@all = [] 
  def initialize(genre)
    @genre = genre
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 