class CommandLineInterface
  def call 
    greeting
    find_choices
    show_genres
  end 
  def greeting
    puts "Hello! Welcome to Goodreads."
  end 
  def find_choices
    Scraper.find_choices
  end 
  def show_genres 
    rows = []
    Genre.all.each_with_index do |genre, i|
      rows << [i+1, genre.name]
    end 
    table = Terminal::Table.new :headings => ['Number', 'Genre'], :rows => rows
    puts table 
    
    puts "What genre would you like more information on?"
    answer = gets.strip.to_i
    if answer.between?(1,Genre.all.length)
      puts "Great choice! Here are some more details."
      chosen_genre = Genre.all[answer-1]
      Selected_book.all.clear #this clears all selected books so there's not a duplicate output
      Scraper.get_detail(chosen_genre)
    else 
      puts "This is not a valid number. Please try again."
      show_genres
    end
    show_selected_book(chosen_genre)
  end 
  def show_selected_book(chosen_genre)
    rows = [] 
    Selected_book.all.each_with_index do |book, i|
      rows << [i+1, book.title_and_author]
    end 
    table = Terminal::Table.new :headings => ['Number', 'Title and Author'], :rows => rows
    puts table 
    puts "Please pick a number or type 'back' to review more genres."
    answer = gets.strip
    if answer == "back"
      show_genres
    end
    if answer.to_i.between?(1,Selected_book.all.length)
      chosen_book = Selected_book.all[answer.to_i-1]
      Scraper.final_detail(chosen_book)
    else 
      puts "This is not a valid number. Please try again."
      show_selected_book(chosen_genre)
    end 
    show_final_book(chosen_book)
  end
  def show_final_book(chosen_book)
    puts "Title and Author: #{chosen_book.title_and_author}"
    puts "Rating (Out of 5): #{chosen_book.rating}"
    puts "Number of Ratings: #{chosen_book.number_of_ratings}"
    puts "Description: #{chosen_book.description}"
    puts "Would you like to see another book? (yes/no)"
    answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
          show_selected_book(chosen_book)
      elsif answer == "no" || answer == "n"
        puts "Thanks! Come again soon!"
        exit 
      else
        puts "This is not a valid number. Please try again." 
        show_final_book(chosen_book)
      end
  end 
end 