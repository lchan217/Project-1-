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
      if new.title == nil
        new.title = main.css("img")[i].to_a[i][1].split(" by ")[0] 
      end
      if new.author == nil
        new.author = main.css("img")[i].to_a[i][1].split(" by ")[1]
      end
      if new.total_votes == nil 
        new.total_votes = main.css('strong.uitext.result').text.split("\n").each_slice(5).to_a[i][1]
      end
      binding.pry
    end
  end 
end 