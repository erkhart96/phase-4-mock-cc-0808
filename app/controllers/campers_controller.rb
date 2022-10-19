class CampersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper.to_json(include: { activities: {}}), status: :ok
    end

    def create
        new_camper = Camper.create(camper_params)
        render json: new_camper, status: :created
    end

    private
    def not_found
        render json: {error: "Camper not found"}, status: 404
    end

    def camper_params
        params.permit(:name, :age)
    end
end
