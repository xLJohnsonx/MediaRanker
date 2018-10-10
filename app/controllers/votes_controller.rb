class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  def new
    @vote = Vote.new
  end

  def destroy
  end

  def upvote
  end

  def index
  end

  def show
    @votes = Vote.all
  end

  def create
     @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        flash[:success] = 'vote successfully created'
        format.html { redirect_to @vote, notice: 'vote was successfully created.' }
      else
        flash.now[:error] = 'vote not created!'
        @vote.errors.messages.each do |field, messages|
          flash.now[field] = messages
        end
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:user_id, :work_id)
    end
    
end
