class TicketsController < ApplicationController
  include HTTParty
  
  def paginate

    if (params[:id].to_i < 1) || (all_digits(params[:id]) == false)
      raise ActionController::RoutingError.new('not_found')
    else
      @page_number = params[:id].to_i
    end

    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets.json?page=#{@page_number}&per_page=25",
                      basic_auth: credentials)

    if (check_error(@response) != true) && (@response['tickets'].empty? == true)
      raise ActionController::RoutingError.new('not_found')
    elsif check_error(@response) != true 
      @tickets = @response.parsed_response['tickets']
    elsif check_error(@response) 
      render :error
    end
    
  end

  def show
    @response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets/#{params[:id]}.json", 
                      basic_auth: credentials)

    check_error(@response) ? (render :error) : @ticket = @response.parsed_response['ticket']
    
    if @response.parsed_response['error'] == 'RecordNotFound'
      raise ActionController::RoutingError.new('not_found')
    end
  end

  private
  def credentials
    @auth = {username: Rails.application.credentials.zendesk_api[:username], 
      password: Rails.application.credentials.zendesk_api[:password]}
  end

  def check_error(response)
    if (response.code == 404 || response.code == 401 || response.code == 503)
      true
    end   
  end

  def all_digits(str)
    str[/[0-9]+/] == str
  end
end
