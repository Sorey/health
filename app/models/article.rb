class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :publish_on, type: Boolean

  belongs_to :articles_group
end
