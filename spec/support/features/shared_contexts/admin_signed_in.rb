shared_context "current admin signed in" do
  let(:current_admin) { create :admin }

  background do
    login_as current_admin
  end
end
