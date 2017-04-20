class Admin::StatisticGallery
  include Mongoid::Document
  include Mongoid::MultipleUploaderFix
  # include Sunspot::Mongoid
  require 'carrierwave/mongoid'
  mount_uploaders :statistic_gallery, StatisticGalleryUploader

  field :title, type: String
  field :publish_on, type: Mongoid::Boolean
  field :meta_keywords, type: String
  field :meta_description, type: String
  field :description, type: String

  def statistic_gallery
    res = []
    store_dir = StatisticGalleryUploader.new(self).store_dir
    self[:statistic_gallery].each do |photo|
      test = StatisticGalleryUploader.new(self)
      binding.pry
      test.store!(File.open("#{Rails.root}/#{store_dir}/#{photo}"))
      res << test
    end
    res
  end

  before_save :save_uploaders

  private

  def save_uploaders
    [:statistic_gallery].each do |field_name|
      resave_files(field_name)
    end
  end
end
