class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.boolean :publish_on

      t.belongs_to :articles_group, index: true
      t.timestamps null: false
    end
  end
end
