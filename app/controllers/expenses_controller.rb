class ExpensesController < ApplicationController
  
  def index
  	@expenses = Expense.all

     @q = Expense.ransack(params[:q])
     @expenses = @q.result(distinct: true)
  end

  def new
  	@expense = Expense.new
  end

  def create
  	@expense = Expense.create(expense_params)

  	if @expense.save
  	  redirect_to :action => :index
  	  else
  	  render :new	
  	end
  end

  private

  def expense_params
  	params.require(:expense).permit(:purpose, :amount, :expense_date)
  end

end
