class Admin::Role
  include Mongoid::Document
  Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  field :title, type: String
  field :type_role, type: Integer
  field :parent_id, type: String

  has_and_belongs_to_many :admin_users, :class_name => 'Admin::User'
  has_many :children, :class_name => 'Admin::Role' #, foreign_key: 'parent_id'
  belongs_to :parent, :class_name => 'Admin::Role'

  def self.parent_roles
    all.collect{|a| [a.title, a.id]}
  end

  def self.take_title(role_ask)
    # abort self.title.inspect
    # find(
    #     { title: role_ask }
    # ).limit(1)
    where(title: role_ask).first
  end
end
