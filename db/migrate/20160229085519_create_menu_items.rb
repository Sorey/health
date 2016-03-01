class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|

      t.string :title
      t.integer :type_level
      t.string :type_item
      t.integer :parent_id
      t.string :link
      t.boolean :show
      t.string :description
      t.integer :order_item
      t.string :alias
      t.string :alias_type
      t.integer :id_post
      t.string :link_component
      t.string :link_description
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords


      t.references :parent, index: true

      t.timestamps null: false
    end
  end
end
