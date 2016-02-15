class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.integer :type_role
      t.integer :parent_id

      t.references :parent, index: true

      t.timestamps null: false
    end
  end
end
