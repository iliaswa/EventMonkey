class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :location
      t.datetime :date_details
      t.float :price
      t.string :venue
      t.string :url
      t.string :category
      t.float :lng
      t.float :lat

      t.timestamps
    end
  end
end
