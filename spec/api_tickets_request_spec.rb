require 'rails_helper'
require 'support/response_helper'
require 'httparty'

describe "testing Zendesk Api" , :type => :api do
  include ResponseHelper
  before(:all) do
    @url = "https://donatoivan.zendesk.com/api/v2/tickets.json?"
    @url2 = "https://donatoivan.zendesk.com/api/v2/tickets.json?page=1&per_page=25"
    @next_page = "https://donatoivan.zendesk.com/api/v2/tickets.json?page=2&per_page=25"
  end
  
  before(:each) do
    json_response = File.open("./test/fixtures/tickets.json")
    stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?").
      with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
      to_return(status: 200, body: json_response)

    json_response = File.open("./test/fixtures/tickets25.json")
    stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?page=1&per_page=25").
      with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
      to_return(status: 200, body: json_response)
  end

  it 'queries zendesk Api for all tickets' do
    expect(response_helper(@url)["tickets"].length).to eql(100)
  end

  it 'checks basic auth' do
    expect(response_no_json(@url2).code).to eql(200)
  end

  it 'is not empty' do
    expect(response_helper(@url2)["tickets"].empty?).to eql(false)
  end
  
  it 'has a length of 25 tickets' do
    expect(response_helper(@url2)["tickets"].length).to eql(25)
  end
  
  it 'previous page has a value of nil' do
    expect(response_helper(@url2)["previous_page"]).to eql(nil)
  end

  it 'next page has a valid url value' do
    expect(response_helper(@url2)["next_page"]).to eql(@next_page)
  end
end   
