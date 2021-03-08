class PagesController < ApplicationController
  def index
    @post = Post.includes(:user)
  end
end
