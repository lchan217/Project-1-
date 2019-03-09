class Scraper 
    def self.find_choices
    html = open('https://www.goodreads.com/choiceawards/best-books-2018')
    doc = Nokogiri::HTML(html)
    
    main = doc.css("div").css(".category")
    
    main.each_with_index do |book, i|
      new_book = Book.new 
      new_book.genre = main[i].text.split("\n")[2]
      new_book.url = main.css("a[href]").css("[href*='choiceawards']")[i].values.join
      new_book.winner = main.css("img").css(".category__winnerImage")[i].values[1]
    end 
  end
  def self.get_detail(chosen)
    html = open("https://www.goodreads.com"+chosen.url)
    doc = Nokogiri::HTML(html)
    
    main = doc.css('.inlineblock.pollAnswer.resultShown')
    main.each_with_index do |book, i|
      new = Selected_book.new 
      new.title = book.css("img")[i].to_a[1][1].split(" by ")[0] 
      new.author = book.css("img")[i].to_a[1][1].split(" by ")[1]
      new.total_votes = book.css('strong.uitext.result').text.gsub("\n","").split("votes")[i]
     binding.pry
    end
  end 
end 