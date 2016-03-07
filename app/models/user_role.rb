class UserRole
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  belongs_to :user
  belongs_to :role
end
