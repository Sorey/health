class Admin::Reply
  include Mongoid::Document
  field :answer, type: String
  field :order_answer, type: Integer
  field :count_answer, type: Integer

  validates_presence_of :answer

  embedded_in :admin_test, class_name: 'Admin::Test', :inverse_of => :replies
end
