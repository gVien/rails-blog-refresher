class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show #3
    @article = Article.find(params[:id])
  end

  # Interesting that new can be comment out but Rails still
  # renders the new.html.erb
  def new # 1 for reference
  end


  # p params will return this format
  # {"utf8"=>"✓", "authenticity_token"=>"JL7IJi2/OKRORu/WpGFjM9bBkxIioq9Szhdx4srALcpajYc7cmuF6UUGkDM0erX+UVqQwx2vQmgZwW+o/R0ErQ==", "article"=>{"title"=>"sdfdsfdsf", "text"=>"sdfsfds"}, "commit"=>"Save Article", "controller"=>"articles", "action"=>"create"}
  def create  #2
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

