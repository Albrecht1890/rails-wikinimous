class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    # GET /restaurants/:id
  end

  def new
    # GET /restaurants/new
    @article = Article.new
  end

  def create
    # POST /restaurants
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
    # GET /restaurants/:id/edit
    @article = Article.find(params[:id])
  end

  def update
    # PATCH /restaurants/:id
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    # DELETE /restaurants/:id
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
