class ContributionsController < ApplicationController
 
  def index
  	#@contributions = Contribution.all

     @q = Contribution.ransack(params[:q])
     @contributions = @q.result(distinct: true)
  end

  def new
  	@contribution = Contribution.new
  end

  def create
  	@contribution = Contribution.create(contribution_params)

  	if @contribution.save
  	  redirect_to :action => :index
  	else
  		render :new
  	end
  end

  private 

  def contribution_params
  	params.require(:contribution).permit(:name, :amount, :purpose)
  end
end
