# frozen_string_literal: true

module Api
  module OpenweathermapModules
    module Weather
      def weather(lat:, lon:)
        get(
          'weather',
          {
            lat:,
            lon:,
            units: 'metric'
          }
        )
      end
    end
  end
end
