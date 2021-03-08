class PagesController < ApplicationController
  include Pagy::Backend

  def feed
    @pagy, @posts = pagy(Post.includes(:user))
    #@posts = Post.includes(:user)
    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "posts", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end
  end

  def search
  end

  def query
    @search_param = params[:search].to_s.downcase
    @search_string = '%' + @search_param.gsub(" ","%") + '%'
    @posts = Post.where('LOWER(title) like ?', @search_string)
    render layout: false
  end
end
