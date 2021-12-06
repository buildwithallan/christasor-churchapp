class OffertoriesController < ApplicationController
  before_action :authenticate_user!
  
   def index
     @q = Offertory.ransack(params[:q])
     @pagy, @offertories =pagy(@q.result(distinct: true), items: 10)
  end

  def new
  	@offertory = Offertory.new
  end

  def create
  	@offertory = Offertory.new(offertory_params)

  	if @offertory.save
  		redirect_to offertories_path, notice: "Offertory added successfully"
  	else
  		render :new
  	end
  end

  private

  def offertory_params
  	params.require(:offertory).permit(:description, :amount, :offertory_date)
  end
end
