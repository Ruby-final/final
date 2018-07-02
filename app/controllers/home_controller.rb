class HomeController < ApplicationController
  def index
     @foods = Food.page(params[:page]).per(9)
  end
end
