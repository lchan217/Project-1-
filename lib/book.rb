require_relative "cli.rb"
require_relative "scraper.rb"
require_relative "book.rb"

class Book
  attr_accessor :votes, :previous_award, :title, :author, :rating, :number_of_ratings
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