class Selected_genre
   attr_accessor :title_and_author, :total_votes, :title, :author, :url, :description, :rating, :number_of_ratings
  @@all = [] 
  def initialize(title_and_author, url)
    @title_and_author = title_and_author
    @url = url 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 