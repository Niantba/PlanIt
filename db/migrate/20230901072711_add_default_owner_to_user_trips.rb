class AddDefaultOwnerToUserTrips < ActiveRecord::Migration[7.0]
  def change
    UserTrip.destroy_all
    change_column :user_trips, :owner, :boolean, null: false, default: false
  end
end
