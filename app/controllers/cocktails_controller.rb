class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update, :delete]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    # Not needed
    # @dose = Dose.new(description: doses_params)
    # @dose.cocktail = @cocktail
    # @ingredient = Ingredient.find(params[:cocktail[:dose[:ingredient_id]]])
    # @dose.ingredient = @ingredient
    # if @dose.save
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render :show
    # end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end

  # Also not needed
  # def doses_params
  #   params.require(:cocktail).permit(:dose[:description])
  # end
end
