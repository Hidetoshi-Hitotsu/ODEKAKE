class DropTablePlaces < ActiveRecord::Migration[7.0]
  def change
    drop_table :places
  end
end
