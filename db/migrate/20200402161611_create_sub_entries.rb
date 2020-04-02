class CreateSubEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_entries do |t|
      t.string :japanese
      t.json :jisho
      t.string :jisho_link
      t.json :buddhdic
      t.string :buddhdic_link
      t.json :cjk
      t.string :cjk_link
      t.string :combinations_amount
      t.json :combinations 
    end
  end
end
