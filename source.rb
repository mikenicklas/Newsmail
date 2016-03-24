module Finmail
  class Source
    attr_reader :title, :feed_url, :articles
    
    def initialize(opts={})
      @title = opts[:title]
      @feed_url = opts[:feed]
      @articles = []
    end
    
    def get_articles
      xml = Parser.parse_source(@feed_url)
      xml.search('//item').each do |article|
        parsed_article = Parser.parse_article(article)
        @articles << Article.new(title, parsed_article)
      end
      @articles
    end  
  end
  
end