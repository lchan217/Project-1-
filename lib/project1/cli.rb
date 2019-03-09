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
    answer = gets.strip.to_i-1
    if answer < 0 || answer > 20
      puts "This is not a valid number. Please try again."
      show_books
    else 
      puts "Great choice! Here are some more details."
      Scraper.show_detail
    end 
  end 
end 