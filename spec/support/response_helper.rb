module ResponseHelper
  def response_helper(url)
    response = JSON.load(HTTParty.get(url,
      :basic_auth => {:username => Rails.application.credentials.zendesk_api[:username], 
      :password => Rails.application.credentials.zendesk_api[:password]}))
  end 

  def response_no_json(url)
    response = HTTParty.get(url,
      :basic_auth => {:username => Rails.application.credentials.zendesk_api[:username], 
      :password => Rails.application.credentials.zendesk_api[:password]})
  end
end