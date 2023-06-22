class Api::Openweathermap < Api::Client
  include Weather

  API_URL = 'https://api.openweathermap.org/data/2.5'

  def get(path, params)
    super path, params.merge(appid: ENV['OWM_APPID'])
  end
end
