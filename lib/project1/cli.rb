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
    # Book.all.each_with_index |book, index|
    #   puts "#{index+1}. #{book.title} by #{book.author} - number of votes: #{votes} = previous award: #{previous_award}"
    # end
    # input = gets.strip 
    binding.pry
  end 
end 