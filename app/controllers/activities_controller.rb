class ActivitiesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Activity.all, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        render json: {}, status: :ok
    end

    private
    def not_found
        render json: {error: "Activity not found"}, status: :not_found
    end
end
