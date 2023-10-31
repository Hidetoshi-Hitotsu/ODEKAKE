class AddToiletToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :toilet, :string
  end
end
