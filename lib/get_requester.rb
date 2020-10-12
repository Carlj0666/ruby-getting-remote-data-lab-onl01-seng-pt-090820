
require 'pry'
require 'net/http'
require 'open-uri'
require 'json'


class GetRequester
  
  #attr_accessor :url
  
  def initialize(url)
    # binding.pry
    @url = url
  end
  
  
   def get_response_body
     uri = URI.parse(url)
     response = Net::HTTP.get_response_body(uri)
     response.body
   end
  
  def parse_json
    # we use the JSON library to parse the API response into nicely formatted JSON
    programs = JSON.parse(self.get_response_body)
    programs.collect do |name|
    name["occupation"]  
    end
  end
  
  
  
  
  
  
end