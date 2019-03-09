class Scraper 
    def self.find_choices
    html = open('https://www.goodreads.com/choiceawards/best-of-the-best-2018')
    doc = Nokogiri::HTML(html)
    
    attributes = doc.css('.inlineblock.pollAnswer.resultShown')
    
    attributes.each_with_index do |book, i|
      new_book = Book.new 
      new_book.title_and_author = attributes.css("img")[i].to_a[1][1]
      new_book.votes = attributes.css('strong.uitext.result').text.split("\n").each_slice(5).to_a[i][1]
      new_book.previous_award = attributes.css('strong.uitext.result').text.split("\n").each_slice(5).to_a[i][4]
      new_book.url = attributes.css(".pollAnswer__bookLink")[i]["href"]
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
  def self.get_reading_options(chosen_book)
    html = open("https://www.goodreads.com"+ chosen_book.url)
    doc = Nokogiri::HTML(html)
    chosen_book.kindle = 
    chosen_book.amazon = 
    chosen_book.library = 
    chosen_book.store = 
  end 
end 