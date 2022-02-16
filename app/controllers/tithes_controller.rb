class TithesController < ApplicationController
  before_action :authenticate_user!
  
  def index
     @q = Tithe.ransack(params[:q])
     @pagy, @tithes = pagy(@q.result.includes(:membership), items: 10)
  end

  def new
  	@tithe = Tithe.new
  end

  def create
  	@tithe = Tithe.new(tithe_params)

  	if @tithe.save
  		redirect_to tithes_path, notice: "Tithe added successfully"
  	else
  		render :new
  	end
  end

  private

  def tithe_params
  	params.require(:tithe).permit(:membership_id, :amount, :tithe_date)
  end
end
