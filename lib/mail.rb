module Finmail
  class Mail
    
    attr_reader :rendered_content
    
    def initialize
      articles = []
      content = {}
      @rendered_content = Finmail::Mailer::Builder.render(articles: articles, content: content)
    end
    
    def send
    end
    
  end
end