FactoryGirl.create(:user, email: "user@example.com")
FactoryGirl.create(:admin, email: "admin@example.com")
FactoryGirl.create_list(:feedback, 20)
