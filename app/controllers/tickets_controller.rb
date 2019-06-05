class TicketsController < ApplicationController
  def paginate
    @response_for_page = params[:id].to_i
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets.json?page=#{@response_for_page}&per_page=25", 
                      :basic_auth => credentials)
    check_error(@response) ? (render :error) : @tickets = @response.parsed_response["tickets"]
  end

  def show
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets/#{params[:id]}.json", 
                      :basic_auth => credentials)
    check_error(@response) ? (render :error) : @ticket = @response.parsed_response["ticket"]
  end

  private
  def credentials
    @auth = {:username => Rails.application.credentials.zendesk_api[:username], 
      :password => Rails.application.credentials.zendesk_api[:password]}
  end

  def check_error(response)
    if (response.code == 404 || @response.code == 401)
      true
    end   
  end
end
