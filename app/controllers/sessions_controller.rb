class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome! You've successfully logged in."
        redirect_to "/posts"
      else
        flash["notice"] = "You've entered an incorrect name or password."
        redirect_to "/login"
      end
    else
      flash["notice"] = "You need to create a new account."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye! You're now logged out."
    redirect_to "/login"
  end
end
  