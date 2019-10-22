class CreatePoses < ActiveRecord::Migration[5.2]
  def change
    create_table :poses do |t|
      t.string :name, null: false
      t.text :detail
      t.string :sans_name
      t.string :image

      t.timestamps
    end
  end
end
