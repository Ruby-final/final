class FoodsController < ApplicationController
  
  before_action :set_food, only:[:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @foods = Food.page(params[:page]).per(5)
  end
  
  def new
    @food = Food.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: "Food was created successfully"
    else
      render "new"
    end
  end
  
  def update
   if @food.update(food_params)
     redirect_to foods_path, notice: "food was updated successfully"
   else
    render "edit"
   end
  end

  def destroy
    @food.destroy
    redirect_to foods_path, notice: "food was delete!!"
  end
end

private

  def set_food
      @food = Food.friendly.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :description, :ingredient, :step, :image, :user_id)
  end

  # def find_by
  #   @food = Food.find_by(id: params[:id])
  # end
