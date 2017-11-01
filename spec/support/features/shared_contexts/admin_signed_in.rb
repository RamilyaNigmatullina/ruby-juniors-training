shared_context "admin user signed in" do
  let(:admin) { create :user, :admin }

  background do
    login_as admin
  end
end
