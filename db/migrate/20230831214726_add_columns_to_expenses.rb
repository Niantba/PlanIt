class AddColumnsToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :activity, foreign_key: true
    add_column :expenses, :name, :string
  end
end
