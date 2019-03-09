class Selected_book 
   attr_accessor :title, :author, :total_votes, :url
  @@all = [] 
  def initialize
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 