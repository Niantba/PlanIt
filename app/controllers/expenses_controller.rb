class ExpensesController < ApplicationController
  after_action :verify_authorized, except: [:index]
  def index
    @trip = Trip.find(params[:trip_id])
    @expenses = Expense.where(trip: @trip)
    @user_balances = calculate_user_balances(@expenses)
  end

  def user_name(user_id)
    User.find(user_id).first_name
  end
  helper_method :user_name

  def new
    @trip = Trip.find(params[:trip_id])
    if @trip
      @expense = Expense.new
      @expense.user_expenses.build
      authorize @expense
    else
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    authorize @trip, policy_class: ExpensePolicy
    @expense = Expense.new(expense_params)
    @expense.trip = @trip

    if @expense.save
      redirect_to trip_expenses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def calculate_user_balances(expenses)
    user_balances = Hash.new(0) # Inicializa un hash para almacenar los saldos

    expenses.each do |expense|
      user_balances[expense.user_id] -= expense.amount # Resta el gasto pagado
      expense.user_ids.each do |user|
        user_balances[user] += (expense.amount / expense.user_ids.size) # Suma la parte del gasto para cada usuario
      end
    end

    user_balances
  end

  def expense_params
    params.require(:expense).permit(:amount, :category, :name, :user_id, user_ids: [])
  end
end
