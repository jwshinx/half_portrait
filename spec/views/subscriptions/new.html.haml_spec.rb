require 'spec_helper'

describe "subscriptions/new" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :active => false,
      :product_id => 1,
      :customer_id => 1
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscriptions_path, "post" do
      assert_select "input#subscription_active[name=?]", "subscription[active]"
      assert_select "input#subscription_product_id[name=?]", "subscription[product_id]"
      assert_select "input#subscription_customer_id[name=?]", "subscription[customer_id]"
    end
  end
end
