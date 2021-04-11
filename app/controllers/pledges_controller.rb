class PledgesController < ApplicationController
  def index
  	@q = Pledge.ransack(params[:q])
    @pagy, @pledges = pagy(@q.result(distinct: true))
  end

  def new
  	@pledge = Pledge.new
  end

  def create
  	@pledge = Pledge.create(pledge_params)

  	if @pledge.save
  		redirect_to pledges_path
  	else
  		render :new
  	end
  end

  private

  def pledge_params
  	params.require(:pledge).permit(:membername, :amount, :payment, :remarks)
  end
end
