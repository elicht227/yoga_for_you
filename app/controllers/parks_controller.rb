class ParksController < ApplicationController
  before_action :set_park, only: [:show, :edit, :update, :destroy]

  # GET /parks
  def index
    @parks = Park.all
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
  def edit
  end

  # POST /parks
  def create
    @park = Park.new(park_params)

    if @park.save
      redirect_to @park, notice: 'Park was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parks/1
  def update
    if @park.update(park_params)
      redirect_to @park, notice: 'Park was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parks/1
  def destroy
    @park.destroy
    redirect_to parks_url, notice: 'Park was successfully destroyed.'
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
