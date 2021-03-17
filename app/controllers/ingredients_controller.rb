class IngredientsController < ApplicationController
before_action :find_ingredients, only: [:show, :edit, :update]

    def index
        @ingredients = Ingredient.all
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
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
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def destroy

    end


    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def find_ingredients
        @ingredient = Ingredient.find(params[:id])
    end
end
