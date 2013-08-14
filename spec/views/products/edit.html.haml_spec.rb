require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :allotment => 1,
      :price => 1,
      :period => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_allotment[name=?]", "product[allotment]"
      assert_select "input#product_price[name=?]", "product[price]"
      assert_select "input#product_period[name=?]", "product[period]"
    end
  end
end
