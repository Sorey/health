require 'file_size_validator'
class Admin::News < ActiveRecord::Base
  self.table_name = "news"
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
  skip_callback :update, :before, :store_previous_model_for_img

  private

    def check_valid_image_size
      if self.valid?
        unless :image.blank?
          self.remove_image
        end
      end
    end

end
