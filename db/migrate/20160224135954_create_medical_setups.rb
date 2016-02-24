class CreateMedicalSetups < ActiveRecord::Migration
  def change
    create_table :medical_setups do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :head_doctor
      t.string :email
      t.string :category_level
      t.string :site_address

      t.belongs_to :medical_setup_category, index: true

      t.timestamps null: false
    end
  end
end
