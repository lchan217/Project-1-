class CommandLineInterface
  def call 
    greeting
    find_choices
    show_books
  end 
  def greeting
    puts "Hello! What genre would you like more information on?"
  end 
  def find_choices
    Scraper.find_choices
  end 
  def show_books 
    puts "Please choose a genre."
    Book.all.each_with_index do |book, i|
      puts "#{i+1}. #{book.genre}"
    end 
    answer = gets.strip.to_i
    if answer < 0 || answer > 21
      puts "This is not a valid number. Please try again."
      show_books
    # elsif answer != /[\d]/ 
    #   puts "This is not a valid number. Please try again."
    #   show_books
    else 
      puts "Great choice! Here are some more details."
      chosen = Book.all[answer-1]
      Scraper.get_detail(chosen)
    end 
    show_selected_book(chosen)
  end 
  def show_selected_book(chosen) 
    Selected_book.all.each_with_index do |book, i|
      puts "#{i+1}. #{book.title} by #{book.author} - number of votes: #{book.total_votes}"
    end 
    puts "Please pick a book or type 'back' to review more genres."
    answer = gets.strip.to_i 
    if answer == "back"
      show_books
    else
      chosen1 = Selected_book.all[answer-1]
      Scraper.final_detail(chosen1)
    end 
    show_final_book(chosen1)
  end
end 