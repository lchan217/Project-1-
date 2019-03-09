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
      if chosen.url == "/choiceawards/best-of-the-best-2018"
        new.title = main.css("img")[i].to_a[1][1].split(" by ")[0] 
        new.author = main.css("img")[i].to_a[1][1].split(" by ")[1]
        new.total_votes = main.css('strong.uitext.result').text.split("\n").each_slice(5).to_a[i][1]
        new.url = main.css(".pollAnswer__bookLink")[i]["href"] 
      else 
        new.title = main.css("img")[i].to_a[1][1].split(" by ")[0] 
        new.author = main.css("img")[i].to_a[1][1].split(" by ")[1]
        new.total_votes = main.css('strong.uitext.result').text.gsub("\n","").split("votes")[i]
        new.url = main.css(".pollAnswer__bookLink")[i]["href"] 
      end
    end
  end 
  
  def final_detail(chosen)
    chosen.title
    chosen.author
    chosen.description
    chosen.rating 
    chosen.number_of_ratings
  end 
end 