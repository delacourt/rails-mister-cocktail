class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]
  def new
    # @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

  def edit
  end

  def update
    @cocktail = @dose.cocktail
    @dose.update(dose_params)
    @dose.cocktail = @cocktail

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
