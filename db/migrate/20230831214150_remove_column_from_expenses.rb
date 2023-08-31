class RemoveColumnFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :activity_id
    remove_column :expenses, :activity
  end
end
