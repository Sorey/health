require 'file_size_validator'
class Admin::News
  require 'carrierwave/mongoid'

  include Mongoid::Document

  include Mongoid::Timestamps

  field :title, type: String
  field :pre_text, type: String
  field :description, type: String
  field :publish_up, type: DateTime
  field :publish_down, type: DateTime
  field :publish_on, type: Boolean
  field :image, type: String
  field :meta_keywords, type: String
  field :meta_description, type: String

  # field :user_id, type: String

  # belongs_to :user_id, class_name: 'User'
  belongs_to :user, class_name: 'Admin::User'

  # before_update :check_valid_image_size

  validates :title,  length: { minimum: 5, maximum: 80}, :presence => true
  validates :pre_text, :allow_blank => true,  length: { minimum: 6, maximum: 150}

  validates :description,  length: { minimum: 10}, :presence => true

  validates :image,
            :presence => true,
            :file_size => {
                :maximum => 2.megabytes.to_i, message: 'Максимально-можливий розмір файлу - 2 мб.'
            }

  mount_uploader :image, NewsUploader
  #Save previous image when update image_field is empty
  skip_callback :update, :before, :store_previous_model_for_image

end
