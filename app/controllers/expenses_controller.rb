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
    user_balances = Hash.new { |hash, key| hash[key] = { owes: 0, owed_by: 0 } }

    expenses.each do |expense|
      payer_id = expense.user_id
      total_users = expense.user_ids.size

      expense.user_ids.each do |user_id|
        next if user_id == payer_id

        share = expense.amount / total_users
        user_balances[payer_id][:owes] += share
        user_balances[user_id][:owed_by] += share
      end
    end

    user_balances
  end

  def expense_params
    params.require(:expense).permit(:amount, :category, :name, :user_id, user_ids: [])
  end
end
