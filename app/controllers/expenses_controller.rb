class ExpensesController < ApplicationController
  def index
    @user_trips = current_user.user_trips
    @expenses = Expense.where(user_trip_id: @user_trips)
    @expenses = policy_scope(Expense)
  end

  def create
    @user_trips = UserTrip.find(params[:user_trip_id])
    @expense = @user_trips.expenses.create(expense_params)

    if @expense.save
      redirect_to expenses_path, status: :unprocessable_entity
    else
      render :new
    end
  end
end
