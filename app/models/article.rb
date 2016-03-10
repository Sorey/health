class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :publish_on, type: Boolean

  # field :meta_title, type: String
  field :meta_description, type: String
  field :meta_keywords, type: String

  belongs_to :articles_group
end
