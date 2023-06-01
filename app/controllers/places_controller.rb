class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["place"]["name"]
      @place["user_id"] - @current_user["id"]
      @place.save
    else
      flash["notice"] = "You must log in to post." 
    end
    redirect_to "/places"
  end

end
