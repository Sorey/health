class CreateAdminNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :pre_text
      t.text :description
      t.datetime :publish_up
      t.datetime :publish_down
      t.boolean :publish_on
      t.string :image

      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
