class ArticlesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :new_article, only: [:create]

  load_resource except: [:create]
  authorize_resource


  def index
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

  private

  def safe_params
    params[:article].permit(:title, :content)
  end

  def new_article
    @article = current_user.articles.build(safe_params)
  end
end
