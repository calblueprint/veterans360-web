class UpvotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @upvote = Upvote.new(upvote_params)

    respond_to do |format|
      if @upvote.save
        format.json { render json: @upvote, status: :created }
      else
        format.html { render :new }
        format.json { render json: @veteran.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  def delete_upvote
    @upvote = Upvote.find_by(resource_id: upvote_params[:resource_id], veteran_id: upvote_params[:veteran_id])
    @upvote.destroy
    render json: @upvote
  end

  private
    def upvote_params
      params.require(:upvote).permit(:resource_id, :veteran_id)
    end
end
