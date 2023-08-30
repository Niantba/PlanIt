class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @expenses = policy_scope(Expense)
  end

  def create
    @user_trips = UserTrip.find(params[:user_trip_id])
    @expense = @user_trips.expenses.build(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: "Expense created successfully."
    else
      render :new
    end
  end
end
