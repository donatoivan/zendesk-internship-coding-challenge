require 'httparty'
require 'rails_helper'

describe "API testing" , :type => :api do
  before do
    @auth = {:username => Rails.application.credentials.zendesk_api[:username], 
            :password => Rails.application.credentials.zendesk_api[:password]}
    @url = "https://donatoivan.zendesk.com/api/v2/tickets.json?&per_page=25"
  end

  it "making a request without authentication" do
    response = HTTParty.get(@url)
    expect(response.code).to eql(401)
  end

  it "making a request with authentication" do
    response = HTTParty.get(@url,
      :basic_auth => @auth)
    expect(response.code).to eql(200)
  end

  it "making a request with an incorrect url" do
    response = HTTParty.get("https://donatoivasdasdan.zendesk.com/api/v2/tickets.json?&per_page=25",
      :basic_auth => @auth)
    expect(response.code).to eql(404)
  end

  it "testing length of tickets is 25 per page" do
    response = HTTParty.get(@url,
      :basic_auth => @auth)
    expect(response.parsed_response['tickets'].length).to eql(25)
  end
end   