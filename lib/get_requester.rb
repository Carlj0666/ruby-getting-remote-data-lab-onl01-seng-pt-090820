
require 'pry'
require 'net/http'
require 'open-uri'
require 'json'


class GetRequester
  
  URL = 'https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json'
JSON_STRING = "[\n  {\n    \"name\": \"Daniel\",\n    \"occupation\": \"LG Fridge Salesman\"\n  },\n  {\n    \"name\": \"Joe\",\n    \"occupation\": \"WiFi Fixer\"\n  },\n  {\n    \"name\": \"Avi\",\n    \"occupation\": \"DJ\"\n  },\n  {\n    \"name\": \"Howard\",\n    \"occupation\": \"Mountain Legend\"\n  }\n]"
CONVERTED_DATA = [{ 'name' => 'Daniel', 'occupation' => 'LG Fridge Salesman' }, { 'name' => 'Joe', 'occupation' => 'WiFi Fixer' }, { 'name' => 'Avi', 'occupation' => 'DJ' }, { 'name' => 'Howard', 'occupation' => 'Mountain Legend' }]
  
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