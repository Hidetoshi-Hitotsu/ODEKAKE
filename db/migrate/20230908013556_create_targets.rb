class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.references :place, null: false, foreign_key: true
      t.references :schoolgrade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
