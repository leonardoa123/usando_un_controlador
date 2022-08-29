class Car < ApplicationRecord
  WHEEL_USAGE_WARNING_THRESHOLD = 0.8

  def full_model
    "#{make} #{model} #{year}"
  end

  def available_trunk_space
    max_trunk_space - current_trunk_usage
  end

  def kilometers_before_wheel_change
    max_wheel_usage_before_change - current_wheel_usage
  end

  def store_in_trunk(amount_to_store)
    to_store = amount_to_store.to_i
    if (current_trunk_usage + to_store) <= max_trunk_space
      update!(current_trunk_usage: current_trunk_usage + to_store)
      
    else
      raise RuntimeError, 'Cannot store requested amount, total exceeds maximum storage'
    end
  end

  def wheel_usage_status
    
    if (current_wheel_usage / max_wheel_usage_before_change) >= WHEEL_USAGE_WARNING_THRESHOLD
      'Please change your wheels'
    else
      'Wheels are OK, you can keep using them'
    end
  end
end
