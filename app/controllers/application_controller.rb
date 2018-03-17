class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end
  
  get '/recipes' do
    #binding.pry
    @recipes = Recipe.all
    erb :recipes
  end

  get '/recipes/:id' do
    @recipe = Recipe.all.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  delete '/recipes/:id/delete' do #delete action
    @recipe = Recipes.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end


  post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
end
