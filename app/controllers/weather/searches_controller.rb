# frozen_string_literal: true

module Weather
  class SearchesController < ApplicationController
    def show
      @info = {
        weather: ::Weather::SearchService.call(city_id: params[:city_id]),
        city_id: params[:city_id],
        cities: City.all # без пагинации для выпадающего спика
      }

      render 'welcome/index'
    end
  end
end
