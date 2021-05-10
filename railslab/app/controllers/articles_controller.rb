class ArticlesController < ApplicationController
  before_action :authorized, only:[:api_index]


  def index
    @articles=Article.all.order("id")
  end
  def api_index
    @articles=Article.all.order("id")
    render :json => @articles ,:root => false
  end 
  def new
    @article=Article.new()
  end
  def create
    #@article = Article.new(article_params)
    @article=current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
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
      render 'edit'
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  def destroy
   Article.find(params[:id]).destroy
   redirect_to articles_path
  end
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end