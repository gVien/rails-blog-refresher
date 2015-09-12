class CommentsController < ApplicationController
  def create
    # find the article
    @article = Article.find(params[:article_id])
    #create the comment for that specific article
    @comment = @article.comments.create(comment_params)
    # redirect to the specific article path
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
