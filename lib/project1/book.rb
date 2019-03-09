class Book
  attr_accessor :winner, :genre
  @@all = [] 
  def initialize
 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 