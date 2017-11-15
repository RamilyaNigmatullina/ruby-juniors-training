require "rails_helper"

feature "Search Feedback" do
  include_context "current admin signed in"

  let(:feedbacks) { page.all("tr") }

  background do
    create :feedback, email: "john@example.com", name: "John Smith", text: "Hello World!"
    create :feedback, email: "misha@example.com", name: "Michael Brown", text: "Help me please!"
  end

  scenario "Admin searches feedback" do
    visit feedbacks_path

    fill_in "search-feedback", with: "Hello"
    click_on "Search"

    expect(feedbacks).to have_content("Hello World!")
    expect(feedbacks).not_to have_content("Help me please!")

    fill_in "search-feedback", with: "Michael Brown"

    expect(feedbacks).to have_content("Help me please!")
    expect(feedbacks).not_to have_content("Hello World!")
  end
end
