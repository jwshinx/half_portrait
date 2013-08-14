require 'spec_helper'

describe "sites/index" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :url => "Url",
        :user_id => 1,
        :submitted => false,
        :processing => false,
        :success => false,
        :failed => false,
        :aasm_state => "Aasm State"
      ),
      stub_model(Site,
        :url => "Url",
        :user_id => 1,
        :submitted => false,
        :processing => false,
        :success => false,
        :failed => false,
        :aasm_state => "Aasm State"
      )
    ])
  end

  it "renders a list of sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Aasm State".to_s, :count => 2
  end
end
