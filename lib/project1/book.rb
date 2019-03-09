class Book
  attr_accessor :winner, :genre, :url
  @@all = [] 
  def initialize
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 