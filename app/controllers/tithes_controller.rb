class TithesController < ApplicationController
  def index
  end

  def new
  	@tithe = Tithe.new
  end

  def create
  	@tithe = Tithe.create(tithe_params)

  	if @tithe.save
  	 redirect_to :action => :index
  	else
  		render :new
  	end
  end

  private

  def tithe_params
  	params.require(:tithe).permit(:amount)
  end
end
