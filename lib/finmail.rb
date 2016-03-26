require 'open-uri'
require 'nokogiri'
require 'gmail'

require_relative 'article'
require_relative 'parser'
require_relative 'source'
require_relative 'social/facebook'
require_relative 'mail'
require_relative 'mailer/builder'

module Finmail
  class Application
    attr_reader :email, :sources, :news
    
    def initialize
      @email = 'mike.nicklas@gmail.com'
      @sources = [{title: 'U.S. Business', feed:'http://www.wsj.com/xml/rss/3_7014.xml'}, 
                  {title: 'Markets News', feed: 'http://www.wsj.com/xml/rss/3_7031.xml'},
                  {title: 'CNN Markets', feed: 'http://rss.cnn.com/rss/money_markets.rss'},
                  {title: 'Seeking Alpha', feed: 'http://seekingalpha.com/tag/wall-st-breakfast.xml'}]
    end
    
    def get_news
      all = []
      sources.each do |source|
        src = Source.new(source)
        src.articles.each do |article|
          puts "#{article.source} | #{article.title} -- #{Social::Facebook.signal(article.link)}"
        end
      end
      all
    end
    
    def send_mail
      mailer = Finmail::Mail.new
      mailer.send
    end
    
  end
end

#a = Finmail::Application.new
#puts a.get_news
