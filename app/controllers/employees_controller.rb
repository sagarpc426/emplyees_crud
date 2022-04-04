class EmployeesController < ApplicationController
  def index
    @emp = Employee.all # returns all records from database
  end

  def new
    @emp = Employee.new # create new record
  end

  def create
    @emp = Employee.new(emp_params)
    respond_to do|format|
      if @emp.save
        format.js
        # redirect_to action: "index"
      else
        render action: "new"
      end
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @emp = Employee.find(params[:id])  # find the particular record to edit
  end

  def update
    @emp = Employee.find(params[:id])
    if @emp.update_attributes(emp_params)
      redirect_to action: 'index'
    else
      render action: 'edit'
    end
  end

  def destroy
    @emp = Employee.find(params[:id])
    @emp.destroy
    redirect_to action: 'index'
  end

  private
    def emp_params
      params.require(:employee).permit(:name, :email)
    end
end
