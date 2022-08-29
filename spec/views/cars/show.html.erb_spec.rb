require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      make: "Make",
      model: "Model",
      year: "Year",
      kilometers: 2.5,
      max_trunk_space: 3,
      current_trunk_usage: 4,
      wheel_usage: 5,
      max_wheel_usage_before_change: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(//)
  end
end
