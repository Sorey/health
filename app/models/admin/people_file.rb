class Admin::PeopleFile
  include Mongoid::Document

  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :publish_on, type: Mongoid::Boolean

  validates :title, length: { minimum: 5, maximum: 100, message: "(Заголовок): мінімально 5, максимально 100 символів."}
  validates :description, length: { minimum: 5, maximum: 300, message: "мінімально 5, максимально 300 символів."}
  validates :file,
            presence: { message: "(Файл): не може бути пустим."}
  # ,
  #           :file_size => {
  #               :maximum => 20.megabytes.to_i, message: 'Максимально-можливий розмір файлу - 20 мб.'
  #           }

  mount_uploader :file, PeopleFileUploader
  skip_callback :update, :before, :store_previous_model_for_file
end
