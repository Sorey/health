class CreateArticlesGroups < ActiveRecord::Migration
  def change
    create_table :articles_groups do |t|
      t.string :title
      t.text :description
      t.boolean :publish_on

      t.timestamps null: false
    end
  end
end
