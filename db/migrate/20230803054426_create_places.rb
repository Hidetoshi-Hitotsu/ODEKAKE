class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
