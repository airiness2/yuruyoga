class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :hold_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :place
      t.string :url
      t.text :detail
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
