class ExpensesController < ApplicationController
  def index
    @trips = current_user.trips
    @expenses = Expense.where(trip_id: @trips)
    @expenses = policy_scope(Expense)
  end

  def new
    @trip = Trip.find(params[:trip_id])
    if @trip
      @expense = Expenses.new
    else
      # Manejo si el UserTrip no existe
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @expense = @trip.expenses.create(expense_params)

    if @expense.save
      redirect_to expenses_path, status: :unprocessable_entity
    else
      render :new
    end
  end
end
