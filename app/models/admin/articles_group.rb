class Admin::ArticlesGroup
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :publish_on, type: Boolean
  has_many :admin_articles, :class_name => 'Admin::Article'
end
