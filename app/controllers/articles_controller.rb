class ArticlesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show, :like, :dislike]
  before_filter :new_article, only: [:create]
  before_filter :find_articles, only: [:index, :like, :dislike]

  load_resource except: [:create, :index]
  authorize_resource except: [:index, :like, :dislike]


  def index
    @articles = @articles.by_user_id(params[:user_id]) if params[:user_id]
  end

  def new
  end

  def create
    if @article.save
      flash[:notice] = 'The news has been added'
      redirect_to article_path(@article)
    else
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update_attributes(safe_params)
      flash[:notice] = 'The article has been updated'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'The article has been deleted'
    redirect_to user_articles_path(current_user)
  end

  def like
    @article.increment(:votes)
    respond_to do |format|
      @article.save
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  def dislike
    @article.decrement(:votes)
    respond_to do |format|
      @article.save
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  private

  def safe_params
    params[:article].permit(:title, :content)
  end

  def new_article
    @article = current_user.articles.build(safe_params)
  end

  def find_articles
    @articles = Article.proper_order.page(params[:page])
  end
end
