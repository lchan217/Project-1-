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
    answer = gets.strip.to_i
    if answer < 0 || answer > 20
      puts "This is not a valid number. Please try again."
      show_books
    # elsif answer != /[\d]/ 
    #   puts "This is not a valid number. Please try again."
    #   show_books
    else 
      puts "Great choice! Here are some more details."
      chosen_book = Book.all[answer-1]
      Scraper.get_detail(chosen_book)
    end 
    show_selected_book(chosen_book)
  end 
  def show_selected_book(chosen_book) 
    puts "Title: #{chosen_book.title} - Author: #{chosen_book.author} - Rating (Out of 5): #{chosen_book.rating} - Number of Ratings: #{chosen_book.number_of_ratings}"
    puts "Would you 1. like to search another book or 2. learn where to buy the book?"
    answer = gets.strip.to_i 
    if answer == 1 
      show_books
    else 
      Scraper.get_reading_options(chosen_book)
    end 
    show_reading_options(chosen_book)
  end 
  def show_reading_options(chosen_book)
  end 
end 