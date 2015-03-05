class RantsController < ApplicationController

  def index
    @rants = Rant.all
    render json: @rants
  end

  def show
    @rant = Rant.find(params[:id])
    render json: @rant
  end



end
