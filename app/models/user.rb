class User < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  def is_in_zone?
    if distance_from([current_lat,current_longitude]) <= radius
      self.is_in_zone = true
    else
      self.is_in_zone = false
    end
  end
end
