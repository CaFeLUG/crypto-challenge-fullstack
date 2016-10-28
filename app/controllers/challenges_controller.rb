class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  def show
  end

  def solve
    logger.debug "RECIBIDO: #{challenge_params.inspect}"
    answer = Challenge.validate_solution(challenge_params["solution"], challenge_params["challenge_id"], current_user)
    if request.xhr?
      render json: {status: answer}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_params
      params.require(:challenge).permit(:id, :name, :challenge_id, :solution)
    end
end
