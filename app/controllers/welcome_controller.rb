# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @info = {
      cities: City.all # без пагинации для выпадающего спика
    }
  end
end
