class TacosController < ApplicationController

  def index
    @fillings = ["Mushrooms", "Carnitas", "Al Pastor", "Steak", "Fish", "Veggie"]
    # render :template => "tacos/index"
  end

end