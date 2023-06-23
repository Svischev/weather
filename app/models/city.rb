class City < ApplicationRecord
  validates :name, :lat, :lon, presence: true
end
