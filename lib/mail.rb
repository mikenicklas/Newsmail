module Newsmail
  class Mail    
    def initialize(articles:[])
      content = {title: 'Hey there'}
      @rendered_content = Newsmail::Mailer::Builder.render(articles: articles, content: content)
    end
    
    def send
      message_body = @rendered_content
      Gmail.connect!(ENV['EMAIL_ADDRESS'], ENV['EMAIL_PASSWORD']) do |gmail|
        gmail.deliver do
          to ENV['EMAIL_ADDRESS']
          subject 'Your Newsmail Update'
          html_part do
            content_type 'text/html; charset=UTF-8'
            body message_body
          end
        end
      end
    end
    
  end
end