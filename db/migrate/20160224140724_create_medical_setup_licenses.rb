class CreateMedicalSetupLicenses < ActiveRecord::Migration
  def change
    create_table :medical_setup_licenses do |t|
      t.date :date_start
      t.date :date_finish
      t.string :number_license

      t.belongs_to :medical_setup, index: true

      t.timestamps null: false
    end
  end
end
