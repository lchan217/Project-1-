class Scraper 
  URL = 'https://www.goodreads.com/choiceawards/best-of-the-best-2018'
  def self.find_choices
    html = open(URL)
    doc = Nokogiri::HTML(html)
    
    attributes = doc.css('.inlineblock.pollAnswer.resultShown')
    
    attributes.each_with_index do |book, i|
      new_book = Book.new 
      new_book.title_and_author = attributes.css("img")[i].to_a[1][1]
      new_book.votes = attributes.css('strong.uitext.result').text.split("\n")[1]
      new_book.previous_award = attributes.css('strong.uitext.result').text.split("\n")[4]
    end 
    binding.pry
  end
end 