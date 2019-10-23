class CreateEffectings < ActiveRecord::Migration[5.2]
  def change
    create_table :effectings do |t|
      t.references :pose, foreign_key: true, index: true, null: false
      t.references :effect, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
