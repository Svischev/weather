module Api::Openweathermap::Weather
  def weather(lat:, lon:)
    get(
      'weather',
      {
        lat: lat,
        lon: lon,
        units: 'metric'
      }
    )
  end
end
