class Scraper 
  def self.find_choices
    html = open('https://www.goodreads.com/choiceawards/best-books-2018')
    doc = Nokogiri::HTML(html)
    
    main = doc.css("div").css(".category")
    
    main.each_with_index do |genre, i|
      name = genre.css("h4").text.strip
      new_genre =  Genre.new(name)
      new_genre.url = genre.css("a[href]")[0].values.join
      new_genre.winner = genre.css("img.category__winnerImage")[0]["alt"]
    end 
  end
  def self.get_detail(chosen_book)
    html = open("https://www.goodreads.com"+chosen_book.url)
    doc = Nokogiri::HTML(html)
    
    main = doc.css('.inlineblock.pollAnswer.resultShown')
    
    main.each_with_index do |book, i|
      title_and_author = book.css("img").first["alt"] 
      url = book.css(".pollAnswer__bookLink")[0]["href"]
      new = Selected_book.new(title_and_author, url)
      if chosen_book.url == "/choiceawards/best-of-the-best-2018"
        new.total_votes = book.css('strong.uitext.result').first.text.gsub("votes","").strip
      else 
        new.total_votes = book.css('strong.uitext.result').text.gsub("votes","").strip
      end
    end
  end 
  
  def self.final_detail(chosen_book)
    html = open("https://www.goodreads.com"+chosen_book.url)
    doc = Nokogiri::HTML(html)
    
    main = doc.css("#metacol")
    
    chosen_book.title = main.css("#bookTitle").text
    chosen_book.author = main.css(".authorName").text 
    chosen_book.description = main.css("#description").text.gsub("more","")
    chosen_book.rating = main.css("#bookMeta").css("span[itemprop]").text.gsub("\n","").strip
    chosen_book.number_of_ratings = main.css("a.gr-hyperlink").first.text.gsub("\n","").strip
  end 
end 