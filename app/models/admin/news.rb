class Admin::News < ActiveRecord::Base
  self.table_name = "news"
  # require 'carrierwave/orm/activerecord'

  mount_uploader :image, NewsUploader
end
