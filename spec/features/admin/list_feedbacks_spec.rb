require "rails_helper"

feature "List feedback", :js do
  include_context "admin user signed in"

  let!(:feedback_1) do
    create :feedback, email: "john.norman@gmail.com", name: "John Norman",
      text: "You should fix article creation form! I can't add title to my article!"
  end
  let!(:feedback_2) do
    create :feedback, email: "peter.burns@gmail.com", name: "Peter Burns",
      text: "I think it's the best site I've ever seen!"
  end

  scenario "Admin see feedbacks" do
    visit feedbacks_path

    def first_feedback
      "#feedback_#{feedback_1.id}"
    end

    def second_feedback
      "#feedback_#{feedback_2.id}"
    end

    within(first_feedback) do
      expect(page).to have_content("john.norman@gmail.com")
      expect(page).to have_content("John Norman")
      expect(page).to have_content("You should fix article creation form! I can't add title to my article!")
    end

    within(second_feedback) do
      expect(page).to have_content("peter.burns@gmail.com")
      expect(page).to have_content("Peter Burns")
      expect(page).to have_content("I think it's the best site I've ever seen!")
    end

    expect(Feedback.order("created_at desc").all).to eq([feedback_2, feedback_1])
  end
end
