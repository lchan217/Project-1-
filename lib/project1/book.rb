class Book
  attr_accessor :votes, :previous_award, :title_and_author, :url, :title, :author, :rating, :number_of_ratings, :description 
  @@all = [] 
  def initialize
 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 