# require 'spec_helper'
# require 'httparty'

# feature 'External request' do
#   before do
#     stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?").
#       with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
#       to_return(status: 200)
#   end

#   it 'basic auth' do
#     url = "https://donatoivan.zendesk.com/api/v2/tickets.json?"

#     response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets.json?",
#           :basic_auth => {:username => Rails.application.credentials.zendesk_api[:username], 
#             :password => Rails.application.credentials.zendesk_api[:password]})

#     expect(response).to be_success
#   end
  
#   before do
#     json_response = File.open("./test/fixtures/tickets.json")
#     stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?").
#       to_return(status: 200, body: json_response)
#   end

#   it 'queries zendesk Api for tickets' do
#     url = "https://donatoivan.zendesk.com/api/v2/tickets.json?"

#     response = JSON.load(HTTParty.get(url))
#     expect(response["tickets"].length).to eql(100)
#   end
# end





# require 'spec_helper'
# require 'httparty'

# describe "API testing" , :type => :api do
#   before do
#     stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?").
#       with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
#       to_return(status: 200)
#     end
    
#     it 'basic auth' do
#       url = "https://donatoivan.zendesk.com/api/v2/tickets.json?"
  
#       response = HTTParty.get("https://donatoivan.zendesk.com/api/v2/tickets.json?",
#             :basic_auth => {:username => Rails.application.credentials.zendesk_api[:username], 
#               :password => Rails.application.credentials.zendesk_api[:password]})
  
#       expect(response.code).to eql(200)
#     end
      
#     before do
#       json_response = File.open("./test/fixtures/tickets.json")
#       stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?").
#         to_return(status: 200, body: json_response)
#     end
  
#     it 'queries zendesk Api for tickets' do
#       url = "https://donatoivan.zendesk.com/api/v2/tickets.json?"
  
#       response = JSON.load(HTTParty.get(url))
#       expect(response["tickets"].length).to eql(100)
#     end
# end   
