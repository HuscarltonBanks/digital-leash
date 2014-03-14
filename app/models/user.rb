class User < ActiveRecord::Base
  validates :username, uniqueness: true
  extend FriendlyId
  friendly_id :username, use: :slugged
  reverse_geocoded_by :latitude, :longitude

  def is_in_zone?
    if longitude.present? && latitude.present? && current_lat.present? && current_longitude.present? && radius.present?
      if distance_from([current_lat,current_longitude]) <= radius
        self.is_in_zone = true
      else
        self.is_in_zone = false
      end
    end
  end
end
