class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :year
      t.float :kilometers, default: 0 # kms of usage for the car
      t.integer :max_trunk_space # "space" to be stored in the car. Just a number, THEY ARE NOT kgs/liters/etc
      t.integer :current_trunk_usage, default: 0
      t.integer :current_wheel_usage, default: 0
      t.integer :max_wheel_usage_before_change

      t.timestamps
    end
  end
end
