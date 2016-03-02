class ChangeTypeLevelInMenuItems < ActiveRecord::Migration
  def change
    change_column :menu_items, :type_level, :string
  end
end
