require 'open-uri'
require 'json'

module Finmail
  module Social
    
    class Facebook  
      BASE = 'https://graph.facebook.com/?id='.freeze
      
      def self.signal(url)
        JSON.parse(fetch_data(url))['shares']
      end
      
      def self.fetch_data(url)
        res = ''
        open(BASE + url).each_line { |i| res << i }
        res
      end
    end
    
  end
end
  