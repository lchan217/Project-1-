class Book
  attr_accessor :winner, :genre, :url, :title, :author, :description, :rating, :number_of_ratings
  @@all = [] 
  def initialize
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 