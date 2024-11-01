class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :authorize_ownership!, only: [ :edit, :update, :destroy ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @is_owner = user_signed_in? && @article.creator_id == current_user.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private def article_params
    params.require(:article).permit(:title, :body).merge(creator_id: current_user.id)
  end

  private def authorize_ownership!
    @article = Article.find(params[:id])
    if @article.creator_id != current_user.id
      raise ForbiddenAccessError
    end
  end

  class ForbiddenAccessError < StandardError
  end

  rescue_from ForbiddenAccessError do
    render inline: "Forbidden", status: :forbidden
  end
end
