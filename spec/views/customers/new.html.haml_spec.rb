require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :firstname => "MyString",
      :lastname => "MyString",
      :active => false
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_firstname[name=?]", "customer[firstname]"
      assert_select "input#customer_lastname[name=?]", "customer[lastname]"
      assert_select "input#customer_active[name=?]", "customer[active]"
    end
  end
end
