class Admin::CitiesController < Admin::BaseController
  def new
    set_cities
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to new_admin_cities_path
    else
      set_cities
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_cities
      @cities = City.all
    end

    def city_params
      params.require(:city).permit(:name, :lat, :lon)
    end
end
