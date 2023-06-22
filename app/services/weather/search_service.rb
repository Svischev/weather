class Weather::SearchService < ApplicationService
  attr_reader :city_id

  def initialize(city_id:)
    @city_id = city_id
  end

  def call
    validate

    Rails.cache.fetch("weather_city_#{city_id}", expires_in: 10.seconds) do
      load_weather.deep_symbolize_keys
    end
  end

  private

  def validate
    halt(:city, :not_found) if city.blank?
  end

  def city
    @city ||= City.find_by(id: city_id)
  end

  def load_weather
    client.weather(lat: city.lat, lon: city.lon)
  end

  def client
    @client ||= Api::Openweathermap.new
  end
end