require 'acceptance/acceptance_helper'

feature 'role feature', %q{
  In order to manage roles
  As an authenticated user
  I want to list, create, update, destroy roles
} do

  before(:each) do
    @user = create_admin_user
  end

  scenario 'listing fabrics' do
    log_in
    visit "/roles"
    page.should have_content("admin")
    page.should have_content("blah")
  end
  scenario 'adding a role' do
    log_in
    visit "/roles/new"
    fill_in "role[name]", :with => "manager"  
    fill_in "role[description]", :with => "meh"
    click_button "Save"
    should_be_on "/roles/#{Role.find_by_name('manager').id}"
    page.should have_content("manager")
    page.should have_content("meh")
  end  
  scenario 'adding a role with blank name' do        
    pending
  end 
  scenario 'adding a role with blank description' do         
    pending
  end
  scenario 'updating a role with blank name' do        
    pending
  end 
  scenario 'updating a role with blank description' do         
    pending
  end 
  scenario 'destroying a role' do         
    pending
  end                                               
end