class TicketsController < ApplicationController
  def paginate
    @auth = {:username => Rails.application.credentials.zendesk_api[:username], 
              :password => Rails.application.credentials.zendesk_api[:password]}
    @response_for_page = params[:id].to_i
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets.json?page=#{@response_for_page}&per_page=25", 
                      :basic_auth => @auth)
    if (@response.parsed_response['tickets'] == nil || @response.parsed_response["error"] == "Couldn't authenticate you")
      render :error
    else
      @tickets = @response.parsed_response["tickets"]
    end
  end

  def show
    @auth = {:username => Rails.application.credentials.zendesk_api[:username], 
              :password => Rails.application.credentials.zendesk_api[:password]}
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets/#{params[:id]}.json", 
                      :basic_auth => @auth)
    @ticket = @response.parsed_response["ticket"]
  end


end
