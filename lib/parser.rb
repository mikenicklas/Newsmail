module Newsmail
  # A basic class to parse the raw XML from source URLs and
  # parse the individual contents of each article.
  #
  class Parser
    class << self
      
      def parse_source(url)
        Nokogiri::XML(open(url))
      end
      
      def parse_article(article)
        {title: content(article, 'title'),
        description: content(article, 'description'),
        link: content(article, 'link')}
      end
      
      def content(article, attr)
        section = article.at(attr)
        section.respond_to?('inner_text') ? section.inner_text : ''
      end
      
    end
  end
end