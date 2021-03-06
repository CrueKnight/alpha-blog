class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
    
  def index
    @articles = Article.all
  end
  
  def new 
    @article = Article.new  
  end
  
  def edit    #method for edit in 'set_article'
  end
  
  def create 
    @article = Article.new(article_params) 
    if @article.save
      flash[:success] = "Article was successfully created" #To display this message, insert approppriate code in 'views/layout/application.html.erb'
      redirect_to article_path(@article)
      #NOTE: Flash appears for 1 redirect cycle.
    else
      render 'new'
    end
  end
  
  def update                                #update, finds instead of new
    if @article.update(article_params)      #update instead of save
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'                         #edit instead of new
    end
  end
  
  def show
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
  
  private 
    def article_params #used to whitelist submittion
      params.require(:article).permit(:title, :description) #permit the values of title and descript)
    end
end
