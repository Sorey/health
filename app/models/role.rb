class Role < ActiveRecord::Base

  has_many :users
  has_many :user_roles
  has_many :users, through: :user_roles, dependent: :destroy

  has_many :children, class_name: "Role", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Role"

  def self.parent
    all.collect{|a| [a.title, a.id]}
  end

  def self.take_title(role_ask)
    where(title: role_ask).take
  end
end
