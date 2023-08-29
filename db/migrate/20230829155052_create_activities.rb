class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :location
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :category
      t.float :price

      t.timestamps
    end
  end
end
