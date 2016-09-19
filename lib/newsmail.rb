require 'open-uri'
require 'nokogiri'
require 'gmail'
require 'slim'
require 'pry'

require_relative 'article'
require_relative 'parser'
require_relative 'source'
require_relative 'social/facebook'
require_relative 'mail'
require_relative 'mailer/builder'

module Newsmail
  class Application
    attr_accessor :sources, :news
    
    def initialize
      @news = []
      @sources = [{title: 'Top Stories', feed:'http://rss.cnn.com/rss/cnn_topstories.rss'},
                  {title: 'U.S. Stories', feed: 'http://rss.cnn.com/rss/cnn_us.rss'}]
    end
    
    def get_news
      sources.each do |source|
        src = Source.new(source)
        @news << src.articles
      end
      @news.flatten!
    end
    
    def send_mail
      mailer = Newsmail::Mail.new(articles: @news)
      mailer.send
    end
    
  end
end

a = Newsmail::Application.new
a.get_news
a.send_mail