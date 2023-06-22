# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather::SearchService do
  describe '#call' do
    let(:call_service) { described_class.call(params) }
    let(:params) do
      {
        city_id: city_id
      }
    end
    let(:city) { create :city }
    let(:city_id) { city.id }
    let(:url) do
      "#{Api::Openweathermap::API_URL}/weather?appid=#{ENV['OWM_APPID']}"\
        "&lat=#{city.lat}&lon=#{city.lon}&units=metric"
    end

    context 'when success' do
      let(:success_response) { { main: { temp: 15.74 } } }

      before do
        stub_request(:get, url)
          .to_return(status: 200, body: success_response.to_json, headers: {})
      end

      it 'check call_service' do
        expect(call_service).to eq success_response
        expect(WebMock).to have_requested(:get, url).once
      end
    end

    context 'when city not found' do
      let(:city_id) { Faker::Number.number }

      it 'check call_service' do
        expect { call_service }.to raise_error(StandardError, 'city: not_found')
        expect(WebMock).not_to have_requested(:get, url)
      end
    end

    context 'when api status is 422' do
      let(:error_hash) { { error: 'error1' } }

      before do
        stub_request(:get, url)
          .to_return(status: 422, body: error_hash.to_json, headers: {})
      end

      it 'check call_service' do
        expect { call_service }.to raise_error(StandardError, "422 #{{ error: 'error1' }.to_json}")
        expect(WebMock).to have_requested(:get, url).once
      end
    end
  end
end
