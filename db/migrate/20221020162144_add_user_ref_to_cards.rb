class AddUserRefToCards < ActiveRecord::Migration[7.0]
  def change
    add_reference :cards, :user, null: false, foreign_key: true
  end
end
