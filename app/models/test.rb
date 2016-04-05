class Test
  include Mongoid::Document
  field :question, type: String
  field :publish_on, type: Mongoid::Boolean
  # field :replies, type: Array
  validates_presence_of :question

  embeds_many :replies, class_name: 'Reply'
end
