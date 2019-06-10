require 'spec_helper'
require 'httparty'

describe "API 404 error testing" , :type => :api do
  before do
    json_response = File.open("./test/fixtures/401.json")
    stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?").
      to_return(status: 401, body: json_response)
    end
      
    it 'returns a 401 code' do
      url = "https://donatoivan.zendesk.com/api/v2/tickets.json?"
  
      response = HTTParty.get(url)
      expect(response.code).to eql(401)
    end

    it 'returns appropriate error body' do
      url = "https://donatoivan.zendesk.com/api/v2/tickets.json?"

      error_msg = "Couldn't authenticate you"
  
      response = JSON.load(HTTParty.get(url,
        :basic_auth => {:username => Rails.application.credentials.zendesk_api[:username], 
          :password => Rails.application.credentials.zendesk_api[:password]}))
      expect(response["error"]).to eql(error_msg)
    end
end   