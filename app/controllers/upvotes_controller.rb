class UpvotesController < ApplicationController
  def new
  end

  def create
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

  def num_upvotes

  end

  private
    def upvote_params
      params.require(:upvote).permit(:resource_id, :veteran_id)
    end
end
