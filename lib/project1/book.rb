class Book
  attr_accessor :winner, :genre, :url, :title, :author, :total_votes
  @@all = [] 
  def initialize
 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 