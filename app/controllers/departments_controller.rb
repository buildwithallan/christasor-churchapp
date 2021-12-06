class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:edit, :update, :destroy]
  
  def index
  	@pagy, @departments = pagy(Department.all, items: 10)
  end

  def new
  	@department = Department.new
  end

  def create
  	@department = Department.new(department_params)

  	if @department.save
  	  redirect_to departments_path, notice: "Department #{@department.name} created successfully"
  	 else
  	  render :new
  	end
  end

  def show   
  end


  def edit
  end

  def update
  	if @department.update(department_params)
  	 redirect_to departments_path, notice: "Department #{@department.name} updated successfully"
  	else
  		render :edit
  	end
  end

  def destroy
   @department.destroy
   redirect_to departments_path, notice: "Department #{@department.name} deleted"
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
  	params.require(:department).permit(:name)
  end
end
