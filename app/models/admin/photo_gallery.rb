class Admin::PhotoGallery
  include Mongoid::Document

  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :publish_on, type: Mongoid::Boolean

  embeds_many :photos, class_name: 'Photo'

  # validates :question,  length: { minimum: 3, maximum: 120, message: "(Заголовок): мінімально 3, максимально 120 символів."}
end


class Photo
  include Mongoid::Document
  require 'carrierwave/mongoid'

  include Mongoid::Timestamps
  field :title, type: String
  field :order_photo, type: Integer

  # validates :answer,  length: { minimum: 3, maximum: 120, message: "(Заголовок): мінімально 3, максимально 120 символів."} #, presence: { message: "не може бути пустим"}
  # validates_presence_of :answer
  # validates :answer,  length: { minimum: 1, maximum: 80}

  embedded_in :admin_photo_gallery, class_name: 'Admin::PhotoGallery', :inverse_of => :photos

  mount_uploader :image, PhotoGalleryUploader
  #Save previous image when update image_field is empty
  skip_callback :update, :before, :store_previous_model_for_image
end
