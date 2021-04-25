class ExpensesController < ApplicationController
  
  def index
     @q = Expense.ransack(params[:q])
     @pagy, @expenses = pagy(@q.result(distinct: true))
  end

  def new
  	@expense = Expense.new
  end

  def create
  	@expense = Expense.create(expense_params)

  	if @expense.save
  	  redirect_to expenses_path, notice: "Expense added successfully"
  	  else
  	  render :new	
  	end
  end

  private

  def expense_params
  	params.require(:expense).permit(:purpose, :amount, :expense_date)
  end

end
