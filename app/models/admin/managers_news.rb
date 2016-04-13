class Admin::ManagersNews
  include Mongoid::Document

  include Mongoid::Timestamps
  field :title, type: String
  field :date_start, type: Date
  field :publish_on, type: Mongoid::Boolean
  field :description, type: String
end
