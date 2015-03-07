class RantsController < ApplicationController

  # before_action :set_user

  def index
    @rants = Rant.all
    render json: @rants
  end

  # def new
  #   @rant = Rant.new
  #   render json: @rant
  # end

  def update
    @rant = Rant.find(params[:id])
    @rant.update(rant_params)
    render json: @rant
  end

  def create
    @rant = Rant.new(rant_params)
    @rant.save
    render json: @rant
    # render(:json => @rant)
    # @rant = @user.rants(rant_params)
  end

  def show
    @rant = Rant.find(params[:id])
    render json: @rant
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
  end


  # def edit
  #   @rant = Rant.find(params[:id])
  #   if @rant.save
  #   else
  #     render json: @rant
  # end

  private

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end

end
