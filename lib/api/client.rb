# frozen_string_literal: true

module Api
  class Client
    def get(path, params)
      request_wrapper do
        Rails.logger.info(
          "Api::Client Get Request. full_url: #{full_path(path)}"
        )

        Faraday.get full_path(path), params
      end
    end

    def post(path, body)
      request_wrapper do
        Rails.logger.info(
          "Api::Client Post Request. full_url: #{full_path(path)}, body: #{body}"
        )

        Faraday.post full_path(path), body
      end
    end

    # по аналогии разработка остальных методов

    private

    def full_path(path)
      "#{self.class::API_URL}/#{path}"
    end

    def request_wrapper
      result =
        begin
          @response = yield
        rescue StandardError => e
          logger(e, 'Api::Client::Exception')
          raise e
        end

      check_http_status(result)
      parse_json(result.body)
    end

    def check_http_status(response)
      case response.status
      when 400..504
        logger("HTTP status error #{response.status}", response.body)

        raise StandardError, "#{response.status} #{response.body}"
      end
    end

    def parse_json(json_string)
      JSON.parse(json_string)
    rescue StandardError => e
      logger(e, json_string)
      raise e
    end

    def logger(exp, json_string)
      # возможно сделать пуши в Sentry/Slack/Telegram и прочее
      Rails.logger.error "Api::Client error: #{exp}"
      Rails.logger.error json_string
    end
  end
end
