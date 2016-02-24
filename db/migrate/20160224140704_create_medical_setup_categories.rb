class CreateMedicalSetupCategories < ActiveRecord::Migration
  def change
    create_table :medical_setup_categories do |t|
      t.string :name
      t.string :type_category

      t.timestamps null: false
    end
  end
end
