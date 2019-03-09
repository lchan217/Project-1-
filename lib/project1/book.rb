class Book
  attr_accessor :votes, :previous_award, :title_and_author, :title, :author, :rating, :number_of_ratings
  @@all = [] 
  def initialize
 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 