require 'file_size_validator'
# require 'sunspot_rails'
class Admin::News
  require 'carrierwave/mongoid'
  include Mongoid::Document
  include Sunspot::Mongoid

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

  belongs_to :user, class_name: 'Admin::User'


  searchable do
    text :title, :description
    time :created_at
    boolean :publish_on
  end

  validates :title,  length: { minimum: 5, maximum: 80, message: "(Заголовок): мінімально 5, максимально 80 символів."}
  validates :pre_text, :allow_blank => true,  length: { minimum: 6, maximum: 150, message: "(Стислий опис): мінімально 6, максимально 150 символів."}
  validates :image,
            presence: { message: "(Картинка): не може бути пустим."},
            :file_size => {
                :maximum => 2.megabytes.to_i, message: 'Максимально-можливий розмір картинки - 2 мб.'
            }
  validates :meta_keywords, :allow_blank => true,  length: { minimum: 3, maximum: 160, message: "(Ключові слова): мінімально 3, максимально 150 символів."}
  validates :meta_description, :allow_blank => true,  length: { minimum: 5, maximum: 250, message: "(Опис для пошуку): мінімально 5, максимально 250 символів."}
  validates :description, presence: { message: "(Повний опис): не може бути пустим."}

  mount_uploader :image, NewsUploader
  #Save previous image when update image_field is empty
  skip_callback :update, :before, :store_previous_model_for_image
end
