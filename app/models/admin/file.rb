class Admin::File
  include Mongoid::Document
  require 'carrierwave/mongoid'

  include Mongoid::Timestamps
  field :file, type: String
  field :description, type: String

  belongs_to :admin_role, :class_name => 'Admin::Role'

  validates :description,  length: { minimum: 10, maximum: 1000, message: "мінімально 10, максимально 1000 символів."}

  mount_uploader :file, FileUploader
  skip_callback :update, :before, :store_previous_model_for_file

  def self.get_files user_role
    if user_role.is_admin? || user_role.is_manager?
      all
    else
      where(:admin_role_id => user_role)
    end
  end
end
