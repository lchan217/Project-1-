class CommandLineInterface
  def call 
    greeting
    find_choices
    show_books
  end 
  def greeting
    puts "Hello! What book would you like more information on?"
  end 
  def find_choices
    Scraper.find_choices
  end 
  def show_books 
    puts "Please choose a book."
    Book.all.each_with_index do |book, i|
      puts "#{i+1}. Title and Author: #{book.title_and_author} - Votes: #{book.votes} - Award Won: #{book.previous_award}"
    end 
  end 
end 