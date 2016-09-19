module Newsmail
  class Source
    attr_reader :title, :feed, :articles
    
    def initialize(opts={})
      @title = opts[:title]
      @feed = opts[:feed]
      @articles = []
    end
    
    def get_articles
      xml = Parser.parse_source(feed)
      xml.search('//item').each do |article|
        parse_and_create_article(article)
      end
      @articles
    end
    
    def articles
      return @articles if @articles.any?
      get_articles
    end
    
    def parse_and_create_article(article)
      parsed_article = Parser.parse_article(article)
      @articles << Article.new(title, parsed_article)
    end
    
  end
end