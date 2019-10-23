class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: true, index: true, null: false
      t.references :diary, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
