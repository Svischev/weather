# frozen_string_literal: true

FactoryBot.define do
  factory(:city) do
    name { Faker::Address.city }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
  end
end
