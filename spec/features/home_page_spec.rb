require 'rails_helper'

describe "Home page" do
  before do
    visit root_path
  end

  scenario "be redirected to tickets list" do
    click_link "View Tickets"
    expect(current_path).to eq '/tickets/pages/1'
  end
end