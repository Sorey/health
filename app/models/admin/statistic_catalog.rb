class Admin::StatisticCatalog
  # require 'carrierwave/mongoid'
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  # before_save :jjjjj

  validates :name, :presence => true
  validates :images, :presence => true
  # ,
  #           :presence => true
            # :file_size => {
            #     :maximum => 2.megabytes.to_i, message: 'Максимально-можливий розмір файлу - 2 мб.'
            # }

  mount_uploaders :images, StatisticCatalogsUploader

  def jjjjj
    abort self.images.inspect
  end

  #Save previous image when update image_field is empty
  # skip_callback :update, :before, :store_previous_model_for_images
end
