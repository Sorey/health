# class Reply
#   include Mongoid::Document
#   field :answer, type: String
#   field :order_answer, type: Integer
#   field :count_answer, type: Integer
#
#
#   validates_presence_of :answer
#
#   embedded_in :test, class_name: 'Test', :inverse_of => :replies
# end
