module Finmail
  class Mail
    
    attr_reader :rendered_content
    
    def initialize(content=[])
      @rendered_content = Finmail::Mailer::Builder.render(content)
    end
    
  end
end