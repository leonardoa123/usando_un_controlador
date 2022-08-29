require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      make: "MyString",
      model: "MyString",
      year: "MyString",
      kilometers: 1.5,
      max_trunk_space: 1,
      current_trunk_usage: 1,
      wheel_usage: 1,
      max_wheel_usage_before_change: ""
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input[name=?]", "car[make]"

      assert_select "input[name=?]", "car[model]"

      assert_select "input[name=?]", "car[year]"

      assert_select "input[name=?]", "car[kilometers]"

      assert_select "input[name=?]", "car[max_trunk_space]"

      assert_select "input[name=?]", "car[current_trunk_usage]"

      assert_select "input[name=?]", "car[wheel_usage]"

      assert_select "input[name=?]", "car[max_wheel_usage_before_change]"
    end
  end
end
