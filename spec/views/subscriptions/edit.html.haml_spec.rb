require 'spec_helper'

describe "subscriptions/edit" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :active => false,
      :product_id => 1,
      :customer_id => 1
    ))
  end

  it "renders the edit subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do
      assert_select "input#subscription_active[name=?]", "subscription[active]"
      assert_select "input#subscription_product_id[name=?]", "subscription[product_id]"
      assert_select "input#subscription_customer_id[name=?]", "subscription[customer_id]"
    end
  end
end
