class Selected_book 
   attr_accessor :title, :author, :total_votes, :url, :title1, :author1, :description, :rating, :number_of_ratings
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