class Admin::Poll
  include Mongoid::Document
  field :question, type: String
  field :publish_on, type: Boolean
  field :order_question, type: Integer

  validates_presence_of :question

  embeds_many :replies, class_name: 'Reply'
end

class Reply
  include Mongoid::Document
  field :answer, type: String
  field :name, type: String
  field :value, type: String
  field :order_answer, type: Integer
  field :count_answer, type: Integer

  # validates_presence_of :answer
  # validates :answer,  length: { minimum: 1, maximum: 80}

  embedded_in :admin_question, class_name: 'Admin::Poll', :inverse_of => :replies
end
