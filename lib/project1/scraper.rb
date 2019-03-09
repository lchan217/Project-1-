class Scraper 
  URL = 'https://www.goodreads.com/choiceawards/best-of-the-best-2018'
  def self.find_choices
    html = open(URL)
    doc = Nokogiri::HTML(html)
    
    title = doc.css(".pollAnswer__bookLink").css("img")
    
    title.each do |book|
      new_book = Book.new
      new_book.title_and_author = book.first[1]
    end 
    binding.pry
  end

end 