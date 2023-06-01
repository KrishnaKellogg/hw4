class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    @user["email"] = params["user"]["email"]
    @user["password"] = @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/posts"
  end
end
