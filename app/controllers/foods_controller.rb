class FoodsController < ApplicationController
  
  before_action :find_by, only:[:show, :edit, :update, :destroy]
  
  def index
    @foods = Food.all
  end
  
  def new
    @food = Food.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @food = Food.new(food_params)

    if @food.save
      #flash[:notice] = "Candidate was created successfully"
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
  def food_params
    params.require(:food).permit(:name, :description, :ingredient, :step, :image, :user_id)
  end

  def find_by
     @food = Food.find_by(id: params[:id])
  end
