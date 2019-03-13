class Scraper 
    def self.find_choices
    html = open('https://www.goodreads.com/choiceawards/best-books-2018')
    doc = Nokogiri::HTML(html)
    
    main = doc.css("div").css(".category")
    
    main.each_with_index do |book, i|
      genre = book.css("h4").text.strip
      new_book = Book.new(genre)
      new_book.url = book.css("a[href]").css("[href*='choiceawards']")[0].values.join
      new_book.winner = book.css("img.category__winnerImage")[0]["alt"]
    end 
  end
  def self.get_detail(chosen)
    html = open("https://www.goodreads.com"+chosen.url)
    doc = Nokogiri::HTML(html)
    
    main = doc.css('.inlineblock.pollAnswer.resultShown')
    main.each_with_index do |book, i|
      title_and_author = book.css("img").first["alt"] 
      url = book.css(".pollAnswer__bookLink")[0]["href"]
      new = Selected_genre.new(title_and_author, url)
      if chosen.url == "/choiceawards/best-of-the-best-2018"
        new.total_votes = book.css('strong.uitext.result').first.text.gsub("votes","").strip
      else 
        new.total_votes = book.css('strong.uitext.result').text.gsub("votes","").strip
      end
    end
  end 
  
  def self.final_detail(chosen1)
    html = open("https://www.goodreads.com"+chosen1.url)
    doc = Nokogiri::HTML(html)
    main = doc.css("#metacol")
    chosen1.title = main.css("#bookTitle").text
    chosen1.author = main.css(".authorName").text 
    chosen1.description = main.css("#description").text.gsub("more","")
    chosen1.rating = main.css("#bookMeta").css("span[itemprop]").text
    chosen1.number_of_ratings = main.css("a.gr-hyperlink").first.text
  end 
end 