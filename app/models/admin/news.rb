require 'file_size_validator'
class Admin::News
  require 'carrierwave/mongoid'
  # self.table_name = "news"
  include Mongoid::Document
  # include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps

  field :title, type: String
  field :pre_text, type: String
  field :description, type: String
  field :publish_up, type: DateTime
  field :publish_down, type: DateTime

  field :publish_on, type: Boolean
  field :image, type: String
  field :user_id, type: Integer

  belongs_to :user_id, class_name: 'User'

  before_update :check_valid_image_size

  validates :title,  length: { minimum: 3, maximum: 40}, :presence => true
  validates :pre_text,  length: { minimum: 6, maximum: 80} unless :pre_text.blank?
  validates :description,  length: { minimum: 10}, :presence => true
  # validates :password,  length: { minimum: 6}, on: :create #if :password.blank?

  validates :image,
            :presence => true,
            :file_size => {
                :maximum => 2.megabytes.to_i, message: 'Максимально-можливий розмір файлу - 2 мб.'
            }

  mount_uploader :image, NewsUploader
  #Save previous image when update image_field is empty
  skip_callback :update, :before, :store_previous_model_for_image

  private

    def check_valid_image_size
      if self.valid?
        unless :image.blank?
          self.remove_image
        end
      end
    end

end
