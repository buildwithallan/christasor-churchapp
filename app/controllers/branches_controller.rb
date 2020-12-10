class BranchesController < ApplicationController
  def index
  	@branches = Branch.all
  end

  def new
  	@branch = Branch.new
  end


  def create
  	@branch = Branch.create(branch_params)

  	if @branch.save
  	 redirect_to :action => :index
  	 else
  	 render :new	
  	end
  end

  def edit
  	@branch = Branch.find(params[:id])
  end

  def update
  	@branch = Branch.find(params[:id])

  	if @branch.update(branch_params)
  	redirect_to @branch
    else
  	render :edit
    end
  end


  private

  def branch_params
  	params.require(:branch).permit(:country, :district, :location, :branchname, :leaders_name, :contact1, :contact2, :contact3 )
  end
end
