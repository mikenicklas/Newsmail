module Newsmail
  module Mailer
    class Builder
      
      def self.render(articles:[],content:{})
        content[:articles] = articles
        template = Slim::Template.new('lib/mailer/templates/general.slim')
        template.render(content)
      end
      
    end
  end
end