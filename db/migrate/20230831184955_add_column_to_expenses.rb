class AddColumnToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :user, null: false, foreign_key: true
    add_column :expenses, :activity, :string
    add_column :expenses, :amount, :float
    add_column :expenses, :category, :string
    add_column :expenses, :paid_by, :string
    add_column :expenses, :paid_for, :string
  end
end
