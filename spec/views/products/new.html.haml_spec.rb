require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :allotment => 1,
      :price => 1,
      :period => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_allotment[name=?]", "product[allotment]"
      assert_select "input#product_price[name=?]", "product[price]"
      assert_select "input#product_period[name=?]", "product[period]"
    end
  end
end
