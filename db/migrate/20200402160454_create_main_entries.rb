class CreateMainEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :main_entries do |t|
      t.string :japanese
      t.string :english
      t.string :phonetics
      t.string :page
      t.json :jisho
      t.string :jisho_link
      t.json :buddhdic
      t.string :buddhdic_link
      t.json :cjk
      t.string :cjk_link
      t.json :symbols
    end
  end
end
