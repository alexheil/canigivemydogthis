class FoodsController < ApplicationController

  def show
    @food = Food.friendly.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    unless params[:food][:password] == "alexheil716"
      if @food.save
        flash[:notice] = "You just created " + @food.title + "!"
        redirect_to food_path(@food)
      else
        flash.now[:alert] = 'Whoa! Something went wrong!'
        render 'new'
      end
    else
      redirect_to root_url
    end
  end

  def edit
    @food = Food.friendly.find(params[:id])
  end

  def update
    @food = Food.friendly.find(params[:id])
    if @food.update_attributes(food_params)
      flash[:notice] = "You just updated " + @food.title + "!"
      redirect_to food_path(@food)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      redirect_to root_url
    end
  end

  def destroy
    @food = Food.friendly.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def food_params
      params.require(:food).permit(:title, :description, :answer)
    end

end