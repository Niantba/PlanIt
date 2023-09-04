class RemoveColumnsToExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :paid_for
    remove_column :expenses, :paid_by
    add_column :expenses, :paid_for_id, :integer
    add_column :expenses, :paid_by_id, :integer
  end
end
