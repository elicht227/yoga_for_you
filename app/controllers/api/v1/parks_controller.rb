class Api::V1::ParksController < Api::V1::GraphitiController
  def index
    parks = ParkResource.all(params)
    respond_with(parks)
  end

  def show
    park = ParkResource.find(params)
    respond_with(park)
  end

  def create
    park = ParkResource.build(params)

    if park.save
      render jsonapi: park, status: :created
    else
      render jsonapi_errors: park
    end
  end

  def update
    park = ParkResource.find(params)

    if park.update_attributes
      render jsonapi: park
    else
      render jsonapi_errors: park
    end
  end

  def destroy
    park = ParkResource.find(params)

    if park.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: park
    end
  end
end
