class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :type_way
      t.string :type_item
      t.string :title
      t.integer :parent_id

      t.references :parent, index: true

      t.timestamps null: false
    end
  end
end
