class CommandLineInterface
  def call 
    greeting
    find_choices
  end 
  def greeting
    puts "Hello! What book would you like more information on?"
  end 
  def find_choices
    Scraper.find_choices
  end 
  def 
end 