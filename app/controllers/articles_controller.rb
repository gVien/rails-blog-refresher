class ArticlesController < ApplicationController
  def index #4
    @articles = Article.all
  end

  def show #3
    @article = Article.find(params[:id])
  end

  # Interesting that new can be comment out but Rails still
  # renders the new.html.erb
  def new # 1 for reference
    @article = Article.new  # 5, form still renders to new without this but without this, the errors message will be nil (if error is added in the show.html.erb)
  end

  def edit  #6 this finds the id and the object of Article. We need an update method to update it
    @article = Article.find(params[:id])
  end

  # p params will return this format
  # {"utf8"=>"✓", "authenticity_token"=>"JL7IJi2/OKRORu/WpGFjM9bBkxIioq9Szhdx4srALcpajYc7cmuF6UUGkDM0erX+UVqQwx2vQmgZwW+o/R0ErQ==", "article"=>{"title"=>"sdfdsfdsf", "text"=>"sdfsfds"}, "commit"=>"Save Article", "controller"=>"articles", "action"=>"create"}
  def create  #2
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def update  #7, after edit method
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

