# frozen_string_literal: true

class ApplicationService
  def self.call(params = {})
    new(**params).call
  end

  def halt(key = nil, message = nil)
    # тут можно обработать ошибки сервисов

    raise StandardError.new "#{key}: #{message}"
  end
end
