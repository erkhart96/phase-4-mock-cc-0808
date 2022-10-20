class CampersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer, status: :ok # Using custom serializer here to only activate when 'show' is called and not index
    end

    def create
       camper = Camper.create!(camper_params)
       render json: camper, status: :created
    end

    private
    def camper_params
        params.permit(:name, :age)
    end

    def not_found
        render json: {error: "Camper not found"}, status: 404
    end

    def invalid(error)
        render json: { error: error }, status: 422
    end
end
