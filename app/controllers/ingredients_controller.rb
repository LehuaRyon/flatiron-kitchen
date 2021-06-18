class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end
    
    def new
        @ingredient = Ingredient.new
    end

    def create
        ingredient = Ingredient.new(ingredient_params)
        if ingredient.save
            redirect_to ingredients_path
        else
            render :new
        end
    end

    def edit

    end

    def update
        @ingredient.update(ingredient_params)
        if @ingredient.save
            redirect_to ingredients_path
        else
            render :edit
        end
    end

    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end
end
