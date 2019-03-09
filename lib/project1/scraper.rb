class Scraper 
    def self.find_choices
    html = open('https://www.goodreads.com/choiceawards/best-books-2018')
    doc = Nokogiri::HTML(html)
    
    main = doc.css("div").css(".category")
    
    main.each_with_index do |book, i|
      new_book = Book.new 
      new_book.genre = main[i].text.split("\n")[2]
      new_book.winner = main.css("img").css(".category__winnerImage")[i].values[1]
    end 
  end
  def self.get_detail(chosen_book)
    html = open("https://www.goodreads.com"+ chosen_book.url)
    doc = Nokogiri::HTML(html)
    
    attributes = doc.css("#metacol")

    chosen_book.title = attributes.css("#bookTitle").text.split("\n")[1].strip
    chosen_book.author = attributes.css(".authorName").text
    chosen_book.rating = attributes.css("#bookMeta").css("span").text.split("\n")[1].strip
    chosen_book.number_of_ratings = attributes.css(".gr-hyperlink").text.split("\n")[2].strip
  end 
end 