class Book
  attr_accessor :winner, :genre, :url
  @@all = [] 
  def initialize(winner, genre)
    @winner = winner 
    @genre = genre
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 