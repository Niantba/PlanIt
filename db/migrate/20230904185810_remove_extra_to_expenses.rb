class RemoveExtraToExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :paid_by_id, :integer
    remove_column :expenses, :paid_for_id, :integer
  end
end
