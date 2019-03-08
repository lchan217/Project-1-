class Book
  attr_accessor :votes, :previous_awards, :title_and_author, :title, :author, :rating, :number_of_ratings
  @@all = [] 
  def initialize(title, author)
    @title = title 
    @author = author 
     @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 