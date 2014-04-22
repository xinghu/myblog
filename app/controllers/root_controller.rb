# encoding: UTF-8

class RootController < ApplicationController
  # caches_page :index, :if => Proc.new{ ::Rails.env == 'production' }

  def index
    # @blogs = Kaminari.paginate_array(Blog.get_cache_blogs).page(params[:page]).per(5)
    @blogs = Blog.order("id desc").page(params[:page]).per(5)
    @title = "hupengxing's blog"
  end
end
