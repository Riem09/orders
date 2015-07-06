class Api::LocationsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
   render json: Location.all
  end

  def show
  newLoc = Location.find(params[:id])
  render json: newLoc
  end

  def create
  newLoc = Location.new(loc_params)
  if newLoc.save
  render status: 200, json: {
    message: "Succesfully created location",
    newLoc: newLoc,
  }.to_json
  else
    render status: 422, json: {
     errors: newLoc.errors
    }.to_json
  end
  end

  def update
  newLoc = Location.find(params[:id])
  if newLoc.update(loc_params)
    render json: {
     status: 200,
     message: "Succesfully updated",
     newLoc: newLoc
    }.to_json
  else
   render json: {
     status: 500,
     message: "Update error",
     newLoc: newLoc
   }
  end
  end

  def destroy
  newLoc = Location.find(params[:id])
  newLoc.destroy
  render json: {
  status: 200,
  message: "Successfully deleted location",
  }.to_json
  end


  private
  def loc_params
    params.require(:locations).permit(:name, :latitude, :longitude, :description)
  end
end  