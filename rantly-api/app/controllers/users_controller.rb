class UsersController < ApplicationController

  def index
    @users = User.all # set instance variable to equal all the rants
    render json: @users # outputs the @user variable as valid JSON
  end

  def show
    @user = User.find(params[:id]) # set @user to 1 specific user returning the value of params[:id]
    render json: @user
  end

  def create
    @user = User.new(user_params)
    # creates a new instance of the User
    # class, then passes the user_params to the new instance.
    # This has NOT been saved yet, only setup
    @user.save # adds the new user to the DB -- just a method getting called on variable
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params) # calls the update method on the @user, update the information on the DB
    #and saves it using the params that were passed in as an argument()
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy # calls the destroy method on the @user. removes @user from the DB.
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
    # params is a hash
    # .require(:user). I only want the :user key coming out of params
    # filtering down to the specific hash we want
    # .permit(...) allows only the specific columns to be changed that are listed
  end

end
