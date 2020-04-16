class AddFieldsToMainEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :main_entries, :comment, :text
    add_column :main_entries, :dict_comment, :text
  end
end
