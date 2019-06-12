require 'rails_helper'
require 'support/response_helper'

describe 'API 404 error testing' , type: :api do
  include ResponseHelper
  before do
    @url = 'https://donatoivan.zendesk.com/api/v2/tickets.json?'
    @error_msg = "Couldn't authenticate you"
    json_response = File.open('./test/fixtures/401.json')
    stub_request(:get, 'https://donatoivan.zendesk.com/api/v2/tickets.json?').
      to_return(status: 401, body: json_response)
    end
      
    it 'returns a 401 code' do
      response = HTTParty.get(@url)
      expect(response.code).to eql(401)
    end

    it 'returns appropriate error body' do
      expect(response_helper(@url)['error']).to eql(@error_msg)
    end
end   