class ContributionsController < ApplicationController

 before_action :authenticate_user!

  def index
     @q = Contribution.ransack(params[:q])
     @pagy, @contributions = pagy(@q.result(distinct: true), items: 10)
  end

  def new
  	@contribution = Contribution.new
  end

  def create
  	@contribution = Contribution.new(contribution_params)

  	if @contribution.save
  	  redirect_to contributions_url, notice: "Contribution added successfully"
  	else
  		render :new
  	end
  end

  private 

  def contribution_params
  	params.require(:contribution).permit(:name, :amount, :purpose, :contribution_date)
  end
end
