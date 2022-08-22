class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :foreign_language
      t.string :primary_lang_txt
      t.string :foreign_lang_txt
      t.string :img_url

      t.timestamps
    end
  end
end
