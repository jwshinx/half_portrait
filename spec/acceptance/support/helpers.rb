module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.
  def log_out
    visit "/users/sign_out"
  end
  def log_in
    visit "/users/sign_in"
    fill_in "Email", :with => "admin@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
  end
  def create_admin_user
    role = Role.create({name: 'admin', description: 'blah'})
    User.create({
      role_id: role.id,
      email: "admin@example.com", password: "password",
      password_confirmation: 'password'
    })
  end
  def should_be_on(path)
    page.current_url.should match(Regexp.new(path))
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance