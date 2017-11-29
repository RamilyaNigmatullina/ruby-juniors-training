require "rails_helper"

feature "Search Feedback", :js do
  include_context "current admin signed in"

  let(:feedbacks) { page.find("tbody") }

  background do
    create :feedback, email: "john@example.com", name: "John Smith", text: "Hello World!"
    create :feedback, email: "misha@example.com", name: "Michael Brown", text: "Help me please!"
  end

  scenario "Admin searches feedback" do
    visit feedbacks_path

    fill_in "Name or Text contains", with: "Hello"
    click_on "Search"

    expect(feedbacks).to have_content("Hello World!")
    expect(feedbacks).not_to have_content("Help me please!")

    fill_in "Name or Text contains", with: "Michael Brown"
    click_on "Search"

    expect(feedbacks).to have_content("Help me please!")
    expect(feedbacks).not_to have_content("Hello World!")
  end
end
