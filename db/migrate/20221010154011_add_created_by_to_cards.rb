class AddCreatedByToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :created_by, :integer
  end
end
