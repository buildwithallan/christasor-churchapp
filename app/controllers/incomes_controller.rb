class IncomesController < ApplicationController
  before_action :authenticate_user!
  
  def index
     @q = Income.ransack(params[:q])
     @pagy, @incomes = pagy(@q.result(distinct: true), items: 10)
  end

  def new
  	@income = Income.new
  end

  def create
  	@income = Income.new(income_params)

  	if @income.save
  		redirect_to incomes_path, notice: "Income added successfully"
  	else
  		render :new
  	end
  end

  private

  def income_params
  	params.require(:income).permit(:totaltithe, :totaloffertory, :totalcontribution, :totalpledge, :month_year)
  end
end
