module Finmail
  class Article
    attr_reader :title, :link, :description, :source
    
    def initialize(source_title, opts={})
      @source = source_title
      @title = opts[:title]
      @link = opts[:link]
      @description = opts[:description]  
    end
    
  end
end