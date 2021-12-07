class ParksController < ApplicationController
  before_action :set_park, only: %i[show edit update destroy]

  def index
    @q = Park.ransack(params[:q])
    @parks = @q.result(distinct: true).includes(:events).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@parks.where.not(park_address_latitude: nil)) do |park, marker|
      marker.lat park.park_address_latitude
      marker.lng park.park_address_longitude
    end
  end

  def show
    @event = Event.new
  end

  def new
    @park = Park.new
  end

  def edit; end

  def create
    @park = Park.new(park_params)

    if @park.save
      redirect_to @park, notice: "Park was successfully created."
    else
      render :new
    end
  end

  def update
    if @park.update(park_params)
      redirect_to @park, notice: "Park was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @park.destroy
    redirect_to parks_url, notice: "Park was successfully destroyed."
  end

  private

  def set_park
    @park = Park.find(params[:id])
  end

  def park_params
    params.require(:park).permit(:park_name, :park_address)
  end
end
