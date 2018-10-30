class StaticPagesController < ApplicationController

  def home
    @foods = Food.all
  end

  def privacy
  end

  def terms
  end

  def about
  end
  
end