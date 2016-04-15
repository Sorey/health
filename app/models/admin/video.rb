class Admin::Video
  include Mongoid::Document

  include Mongoid::Timestamps
  field :title, type: String
  field :iframe, type: String
  field :publish_on, type: Mongoid::Boolean
  field :description, type: String
end
