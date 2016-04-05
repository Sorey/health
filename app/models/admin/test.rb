class Admin::Test
  include Mongoid::Document
  field :question, type: String
  field :publish_on, type: Boolean
  field :replies, type: Array

  validates_presence_of :question

  embeds_many :admin_replies, class_name: 'Admin::Reply'
end
