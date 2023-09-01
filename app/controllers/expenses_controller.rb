class ExpensesController < ApplicationController
  after_action :verify_authorized, except: [:index]
  def index
    @trips = Trip.find(params[:trip_id])
    @expenses = Expense.where(trip: @trips)
    # @expenses = policy_scope(Expense)
    # authorize @expenses, policy_scope: ExpensePolicy
  end

  def new
    @trip = Trip.find(params[:trip_id])
    if @trip
      @expense = Expense.new
      authorize @expense
    else
      # Manejo si el UserTrip no existe
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    authorize @trip, policy_class: ExpensePolicy
    @expense = Expense.new(expense_params)
    @expense.trip = @trip
    @expense.user = current_user
    # @expense.activity = Activity.find(params[:expense][:activity].to_i)
    if @expense.save

      redirect_to trip_expenses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :category, :paid_by, :paid_for, :name)
  end
end
