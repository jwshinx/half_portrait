require 'spec_helper'

describe "sites/new" do
  before(:each) do
    assign(:site, stub_model(Site,
      :url => "MyString",
      :user_id => 1,
      :submitted => false,
      :processing => false,
      :success => false,
      :failed => false,
      :aasm_state => "MyString"
    ).as_new_record)
  end

  it "renders new site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sites_path, "post" do
      assert_select "input#site_url[name=?]", "site[url]"
      assert_select "input#site_user_id[name=?]", "site[user_id]"
      assert_select "input#site_submitted[name=?]", "site[submitted]"
      assert_select "input#site_processing[name=?]", "site[processing]"
      assert_select "input#site_success[name=?]", "site[success]"
      assert_select "input#site_failed[name=?]", "site[failed]"
      assert_select "input#site_aasm_state[name=?]", "site[aasm_state]"
    end
  end
end
