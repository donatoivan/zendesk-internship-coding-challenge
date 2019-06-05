class TicketsController < ApplicationController
  def index
    @auth = {:username => Rails.application.credentials.zendesk_api[:username], 
      :password => Rails.application.credentials.zendesk_api[:password]}
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets.json?per_page=25",
                      :basic_auth => @auth)
    @tickets = @response.parsed_response["tickets"]
  end

  def show
    @auth = {:username => "donato.ivan@gmail.com", :password => "Zendeskcodingchallenge"}
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets/#{params[:id]}.json", 
                      :basic_auth => @auth)
    @ticket = @response.parsed_response["ticket"]
  end

  def paginate
  end
end
