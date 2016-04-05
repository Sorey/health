class Admin::Test
  include Mongoid::Document
  field :question, type: String
  field :publish_on, type: Boolean
  field :order_answer, type: Integer

  validates_presence_of :question

  embeds_many :admin_replies, class_name: 'Reply'
end
