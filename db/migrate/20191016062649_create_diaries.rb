class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title, null: false, default: '無題'
      t.date :worked_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.text :body
      t.integer :rank, null: false, default: 1
      t.string :image

      t.timestamps
    end
  end
end
