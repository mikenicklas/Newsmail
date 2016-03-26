require 'open-uri'
require 'nokogiri'
require 'gmail'
require 'slim'

require_relative 'article'
require_relative 'parser'
require_relative 'source'
require_relative 'social/facebook'
require_relative 'mail'
require_relative 'mailer/builder'

module Finmail
  class Application
    attr_accessor :sources, :news
    
    def initialize
      @news = []
      @sources = [{title: 'U.S. Business', feed:'http://www.wsj.com/xml/rss/3_7014.xml'},
                  {title: 'Markets News', feed: 'http://www.wsj.com/xml/rss/3_7031.xml'}]
    end
    
    def get_news
      sources.each do |source|
        src = Source.new(source)
        @news << src.articles
      end
      @news.flatten!
    end
    
    def send_mail
      mailer = Finmail::Mail.new(articles: @news)
      mailer.send
    end
    
  end
end

# a = Finmail::Application.new
# a.get_news
# a.send_mail