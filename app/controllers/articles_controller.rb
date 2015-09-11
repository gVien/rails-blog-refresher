class ArticlesController < ApplicationController
  # Interesting that new can be comment out but Rails still
  # renders the new.html.erb
  def new
  end

  def create
    render plain: params[:article].inspect
  end
end
