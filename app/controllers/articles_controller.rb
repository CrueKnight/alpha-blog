class ArticlesController < ApplicationController
  def new 
    @article = Article.new  
  end
  
  def create 
    @article = Article.new(article_params) 
    if @article.save
      flash[:notice] = "Article was successfully created" #To display this message, insert approppriate code in 'views/layout/application.html.erb'
      redirect_to article_path(@article)
      #NOTE: Flash appears for 1 redirect cycle.
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id]) 
  end
  
  private 
    def article_params
      params.require(:article).permit(:title, :description) #permit the values of title and descript)
    end
end
