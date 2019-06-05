class TicketsController < ApplicationController
  def index
    @auth = {:username => Rails.application.credentials.zendesk_api[:username], 
      :password => Rails.application.credentials.zendesk_api[:password]}
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets.json?per_page=25",
                      :basic_auth => @auth)
  end

  def show
  end

  def paginate
  end
end
