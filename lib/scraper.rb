require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper 
  #def self.find_choices
    html = open('https://www.goodreads.com/choiceawards/best-of-the-best-2018')
    doc = Nokogiri::HTML(html)
    
    array = doc.css('.inlineblock.pollAnswer.resultShown').css('strong.uitext.result').text.split("\n")

    number_of_votes = separated_array = array.each_slice(5).to_a[1][1]

    previous_award = separated_array = array.each_slice(5).to_a[1][4]

    title = doc.css(".pollAnswer__bookLink").css("img").first["alt"].split(" by ")[0]

    author = doc.css(".pollAnswer__bookLink").css("img").first["alt"].split(" by ")[1]

     binding.pry
  #end 
end 