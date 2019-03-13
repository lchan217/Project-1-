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
    Genre.all.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end 
    puts "What genre would you like more information on?"
    answer = gets.strip.to_i
    if answer > 0 && answer < Genre.all.length+1
      puts "Great choice! Here are some more details."
      chosen = Genre.all[answer-1]
      Selected_book.all.clear #this clears all selected books so there's not a duplicate output
      Scraper.get_detail(chosen)
    else 
      puts "This is not a valid number. Please try again."
      show_genres
    end
    show_selected_book(chosen)
  end 
  def show_selected_book(chosen) 
    Selected_book.all.each_with_index do |book, i|
      puts "#{i+1}. #{book.title_and_author} - number of votes: #{book.total_votes}"
    end 
    puts "Please pick a book or type 'back' to review more genres."
    answer = gets.strip
    if answer == "back"
      show_genres
    end
    if answer.to_i > 0 && answer.to_i < Selected_book.all.length+1
      chosen1 = Selected_book.all[answer.to_i-1]
      Scraper.final_detail(chosen1)
    else 
      puts "This is not a valid number. Please try again."
      show_selected_book(chosen)
    end 
    show_final_book(chosen1)
  end
  def show_final_book(chosen1)
    puts "Title and Author: #{chosen1.title_and_author}"
    puts "Ratings: #{chosen1.rating}"
    puts "Number of Ratings: #{chosen1.number_of_ratings}"
    puts "Description: #{chosen1.description}"
    puts "Would you like to see another book? (yes/no)"
    answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
          show_selected_book(chosen1)
      elsif answer == "no" || answer == "n"
        puts "Thanks! Come again soon!"
        exit 
      else
        puts "This is not a valid number. Please try again." 
        show_final_book(chosen1)
      end
  end 
end 