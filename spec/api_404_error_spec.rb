require 'rails_helper'
require 'support/response_helper'

describe "API 404 error testing" , :type => :api do
  include ResponseHelper
  before do
    @url = "https://donatooivan.zendesk.com/api/v2/tickets.json?"
    @title_msg = "No help desk at donatooivan.zendesk.com"
    @msg_body = "There is no help desk configured at this address. This means that the address is available and that you can claim it at http://www.zendesk.com/signup"
    json_response = File.open("./test/fixtures/404.json")
    stub_request(:get, "https://donatooivan.zendesk.com/api/v2/tickets.json?").
      with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
      to_return(status: 404, body: json_response)
    end
      
    it 'returns a 404 code' do
      expect(response_no_json(@url).code).to eql(404)
    end

    it 'returns appropriate error body' do
      expect(response_helper(@url)["error"]["title"]).to eql(@title_msg)
      expect(response_helper(@url)["error"]["message"]).to eql(@msg_body)
    end
end   