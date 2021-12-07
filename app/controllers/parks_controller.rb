class ParksController < ApplicationController
  before_action :set_park, only: %i[show edit update destroy]

  # GET /parks
  def index
    @q = Park.ransack(params[:q])
    @parks = @q.result(distinct: true).includes(:events).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@parks.where.not(park_address_latitude: nil)) do |park, marker|
      marker.lat park.park_address_latitude
      marker.lng park.park_address_longitude
      marker.infowindow "<h5><a href='/parks/#{park.id}'>#{park.park_name}</a></h5><small>#{park.park_address_formatted_address}</small>"
    end
  end

  # GET /parks/1
  def show
    @event = Event.new
  end

  # GET /parks/new
  def new
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit; end

  # POST /parks
  def create
    @park = Park.new(park_params)

    if @park.save
      redirect_to @park, notice: "Park was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /parks/1
  def update
    if @park.update(park_params)
      redirect_to @park, notice: "Park was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /parks/1
  def destroy
    @park.destroy
    redirect_to parks_url, notice: "Park was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_park
    @park = Park.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def park_params
    params.require(:park).permit(:park_name, :park_address)
  end
end
