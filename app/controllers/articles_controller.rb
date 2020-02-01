class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	
	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
	end
	
	def new
		@article = Article.new
	end
	
	def edit
	  @article = Article.find(params[:id])
	end	
	
	def create
		@article = Article.new(article_params)
				
		return redirect_to @article if @article.save
		
		render 'new'		
	end

	def update
		@article = Article.find(params[:id])
	  
		return redirect_to @article if @article.update(article_params)
	  
		render 'edit'
	end
	
	def destroy
	  @article = Article.find(params[:id])
	  
	  @article.destroy
	 
	  redirect_to articles_path
	end	
	
	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
