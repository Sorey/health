class User < ActiveRecord::Base
  has_secure_password

  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  accepts_nested_attributes_for :user_roles

  has_many :news
end
