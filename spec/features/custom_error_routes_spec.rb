require 'spec_helper'
describe 'custom not found page' do
  it 'should respond with 404 page' do
    content_404 = "zendesk\nPage Not Found\nOops! We all make mistakes\nThis page may have moved or you might have typed something incorrectly\nBack to Tickets\n404"
    visit '/ticketasdasasdasd'
    expect(page).to have_content(content_404)
  end
end

describe 'custom internal error page' do 
  it 'should respond with 500 page' do
    content_500 = "We're sorry, but something went wrong.\nIf you are the application owner check the logs for more information."
    visit "/500"
    expect(page).to have_content(content_500)
  end
end