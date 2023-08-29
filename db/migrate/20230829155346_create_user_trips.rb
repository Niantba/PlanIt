class CreateUserTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :user_trips do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :owner

      t.timestamps
    end
  end
end