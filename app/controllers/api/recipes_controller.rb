class Api::RecipesController < ApplicationController
  
  def index

    @current_user = current_user
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
                          img_url: params[:img_url]
                        )

    if @recipe.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @current_user = current_user

    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.img_url = params[:img_url] || @recipe.img_url

    if @recipe.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Successfully removed"}
  end
end