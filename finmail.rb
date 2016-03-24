require 'open-uri'
require 'nokogiri'

require_relative 'article'
require_relative 'parser'
require_relative 'source'

module Finmail
  class Application
    attr_reader :email, :sources
    
    def initialize
      @email = 'mike.nicklas@gmail.com'
      @sources = [{title: 'U.S. Business', feed:'http://www.wsj.com/xml/rss/3_7014.xml'}, 
                  {title: 'Markets News', feed: 'http://www.wsj.com/xml/rss/3_7031.xml'}]
    end
    
    def get_news
      all = []
      @sources.each do |source|
        src = Source.new(source)
        src.get_articles.each do |article|
          puts "#{article.source} | #{article.title}"
        end
      end
    end
    
  end
end

a = Finmail::Application.new
puts a.get_news