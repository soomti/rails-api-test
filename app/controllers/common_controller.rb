class CommonController < ApplicationController
  def index
    @posts = Post.all
  end
end
