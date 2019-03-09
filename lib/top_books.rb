require_relative "project1/version"
require 'pry'
require 'nokogiri'
require 'open-uri'

module Project1
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "project1/cli"
require_relative "project1/scraper"
require_relative "project1/book"
require_relative "project1/selected_book"