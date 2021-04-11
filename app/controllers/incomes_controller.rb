class IncomesController < ApplicationController
  def index
  	@pagy, @incomes = pagy(Income.all)
  end

  def new
  	@income = Income.new
  end

  def create
  	@income = Income.create(income_params)

  	if @income.save
  		redirect_to :action => :index
  	else
  		render :new
  	end
  end

  private

  def income_params
  	params.require(:income).permit(:totaltithe, :totaloffertory, :totalcontribution, :totalpledge, :month_year)
  end
end
