module Finmail
  
  # A basic class to parse the raw XML from source URLs and
  # parse the individual contents of each article.
  #
  class Parser
    class << self
      def parse_source(url)
        Nokogiri::XML(open(url))
      end
      
      def parse_article(article)
        {title: article.at('title').inner_text,
        description: article.at('description').inner_text,
        link: article.at('link').inner_text}
      end
    end  
  end
  
end