class Admin::Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :publish_on, type: Boolean

  # field :meta_title, type: String
  field :meta_description, type: String
  field :meta_keywords, type: String

  belongs_to :admin_articles_group, :class_name => 'Admin::ArticlesGroup'
end
