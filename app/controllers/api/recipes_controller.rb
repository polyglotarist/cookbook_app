class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all 

    search_terms = params[:search]
    if search_terms
      @recipes = @recipes.where("chef iLIKE ?", "%#{search_terms}%")
    end

    @recipes = @recipes.order(:id => :asc)

    render 'index.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                          title: params[:title],
                          chef: params[:chef],
                          ingredients: params[:ingredients],
                          directions: params[:directions],
                          prep_time: params[:prep_time],
                          image_url: params[:image_url]
                        )
    @recipe.save
    render 'show.json.jbuilder'
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url

    @recipe.save
    render 'show.json.jbuilder'
  end


  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Successfully removed"}
  end
end