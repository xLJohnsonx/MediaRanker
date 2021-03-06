class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy, :upvote]

  def new
    @vote = Vote.new
  end

  def destroy; end

  def index
    @votes = Vote.all
  end

  def show; end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      flash[:success] = 'Vote successfully created'
    else
      flash.now[:danger] = 'Vote not created!'
      @vote.errors.messages.each do |field, messages|
        flash.now[field] = messages
      end
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_work
    @vote = Vote.find(params[:id])
    if @vote.nil?
      flash.now[:warning] = 'Work not found'
      redirect_to rooth_path
    end
  end

  def vote_params
    params.require(:vote).permit(:user_id, :work_id)
  end
end