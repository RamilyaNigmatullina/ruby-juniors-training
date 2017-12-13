require "rails_helper"

feature "List feedback", :js do
  include_context "current admin signed in"

  let(:feedbacks) { page.all("tr") }

  let(:feedback_1) { feedbacks[1] }
  let(:feedback_2) { feedbacks[2] }

  background do
    create :feedback, email: "test@test.com", name: "John", text: "Hello world!"
    create :feedback, email: "test2@test.com", name: "Peter", text: "It's a great website"
  end

  scenario "Admin sees list of feedbacks" do
    visit feedbacks_path

    expect(feedback_1).to have_content("It's a great website")
    expect(feedback_2).to have_content("Hello world!")
  end
end
