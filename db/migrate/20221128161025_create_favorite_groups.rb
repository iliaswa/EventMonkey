class CreateFavoriteGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
