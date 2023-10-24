class CreateSchoolgrades < ActiveRecord::Migration[7.0]
  def change
    create_table :schoolgrades do |t|
      t.string :grade

      t.timestamps
    end
  end
end
