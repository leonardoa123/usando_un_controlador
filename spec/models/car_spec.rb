require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'Car model spec' do
    let(:car) do
      Car.create(make: 'Toyota', model: 'Yaris', year: 2019,
                 kilometers: 1000, max_wheel_usage_before_change: 12000,
                 max_trunk_space: 100)
    end
    context 'basic methods' do
      it 'should return basic model info' do
        expect(car.make).to eq 'Toyota'
        expect(car.model).to eq 'Yaris'
      end
    end
  end
end
