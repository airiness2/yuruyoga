class AddPoseToDiary < ActiveRecord::Migration[5.2]
  def change
    add_reference :diaries, :pose, foreign_key: true
  end
end
