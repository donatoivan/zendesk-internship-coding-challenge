require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "GET #paginate" do
    before(:each) do
      json_response = File.open("./test/fixtures/tickets25.json")
      stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets.json?page=1&per_page=25").
      with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
      to_return(status: 200, body: json_response)

      json_response = File.open("./test/fixtures/ticket.json")
      stub_request(:get, "https://donatoivan.zendesk.com/api/v2/tickets/2.json").
      with(basic_auth: [Rails.application.credentials.zendesk_api[:username], Rails.application.credentials.zendesk_api[:password] ]).
      to_return(status: 200, body: json_response)
    end

    it "returns a 200" do
      get(:paginate, params: { id: 1 })
      expect(response).to have_http_status(:success)
    end

    it "returns a 200" do
      get(:show, params: { id: 2 })
      expect(response).to have_http_status(:success)
    end

  end
end