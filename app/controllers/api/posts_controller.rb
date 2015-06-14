class Api::PostsController < ApplicationController
skip_before_filter :verify_authenticity_token
def index
render json: Post.all
end


end
