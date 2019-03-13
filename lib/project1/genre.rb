class Genre
  attr_accessor :winner, :name, :url
  @@all = [] 
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
end 