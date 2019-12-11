class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :status, default: 0, null: false
      t.text :body, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
