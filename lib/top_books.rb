require_relative "project1/version"
require 'pry'
require 'nokogiri'
require 'open-uri'

module Project1
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "cli.rb"
require_relative "scraper.rb"
require_relative "book.rb"
