class Api::PostsController < ApplicationController
skip_before_filter :verify_authenticity_token
def index
 if params[:user_request]
 render json: Post.where(users_id: params[:user_request])
 else
 render json: Post.all
 end
end

def show
post = Post.find(params[:id])
render json: post
end

def create
post = Post.new(post_params)
if post.save
render status: 200, json: {
  message: "Succesfully created post",
  post: post,
}.to_json
else
  render status: 422, json: {
   errors: post.errors
  }.to_json
end
end

def update
post = Post.find(params[:id])
if post.update(post_params)
  render json: {
   status: 200,
   message: "Succesfully updated",
   post: post
  }.to_json
else
 render json: {
   status: 500,
   message: "Update erorr",
   post: post
 }
end
end

def destroy
post = Post.find(params[:id])
post.destroy
render json: {
status: 200,
message: "Successfully deleted post",
}.to_json
end


private
def post_params
  params.require(:post).permit(:order, :users_id, :final_cost)
end
end
