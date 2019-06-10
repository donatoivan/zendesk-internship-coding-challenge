require 'spec_helper'
require 'httparty'

describe "API 404 error testing" , :type => :api do
  before do
    json_response = File.open("./test/fixtures/404.json")
    stub_request(:get, "https://donatooivan.zendesk.com/api/v2/tickets.json?").
      with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
      to_return(status: 404, body: json_response)
    end
      
    it 'returns a 404 code' do
      url = "https://donatooivan.zendesk.com/api/v2/tickets.json?"
  
      response = HTTParty.get(url,
        :basic_auth => {:username => Rails.application.credentials.zendesk_api[:username], 
          :password => Rails.application.credentials.zendesk_api[:password]})
      expect(response.code).to eql(404)
    end

    it 'returns appropriate error body' do
      url = "https://donatooivan.zendesk.com/api/v2/tickets.json?"

      title_msg = "No help desk at donatooivan.zendesk.com"
      msg_body = "There is no help desk configured at this address. This means that the address is available and that you can claim it at http://www.zendesk.com/signup"
  
      response = JSON.load(HTTParty.get(url,
        :basic_auth => {:username => Rails.application.credentials.zendesk_api[:username], 
          :password => Rails.application.credentials.zendesk_api[:password]}))
      expect(response["error"]["title"]).to eql(title_msg)
      expect(response["error"]["message"]).to eql(msg_body)
    end
end   