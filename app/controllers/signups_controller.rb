class SignupsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def invalid(error)
        render json: {errors: error}, status: 422
    end
end
