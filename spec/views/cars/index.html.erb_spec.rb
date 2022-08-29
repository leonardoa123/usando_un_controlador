require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        make: "Make",
        model: "Model",
        year: "Year",
        kilometers: 2.5,
        max_trunk_space: 3,
        current_trunk_usage: 4,
        wheel_usage: 5,
        max_wheel_usage_before_change: ""
      ),
      Car.create!(
        make: "Make",
        model: "Model",
        year: "Year",
        kilometers: 2.5,
        max_trunk_space: 3,
        current_trunk_usage: 4,
        wheel_usage: 5,
        max_wheel_usage_before_change: ""
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", text: "Make".to_s, count: 2
    assert_select "tr>td", text: "Model".to_s, count: 2
    assert_select "tr>td", text: "Year".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
