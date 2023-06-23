# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, :lat, :lon, presence: true
end
