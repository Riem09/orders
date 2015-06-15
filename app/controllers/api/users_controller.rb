class Api::UsersController < ApplicationController
skip_before_filter :verify_authenticity_token

def index
render json: User.all
end

def show
user = User.find(params[:id])
render json: user
end

def create
user = User.new(user_params)
if user.save
render status: 200, json: {
  message: "Succesfully created user",
  post: user,
}.to_json
else
  render status: 422, json: {
   errors: user.errors
  }.to_json
end
end


def update
user = User.find(params[:id])
if user.update(user_params)
  render json: {
   status: 200,
   message: "Succesfully updated user",
   post: user
  }.to_json
else
 render json: {
   status: 500,
   message: "Update erorr",
   post: user
 }
end
end


def destroy
user = User.find(params[:id])
user.destroy
render json: {
status: 200,
message: "Successfully deleted user",
}.to_json
end

private
def user_params
  params.require(:user).permit(:name, :email, :contact)
end

end
