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
  has_many :admin_menu_items, :class_name => 'Admin::MenuItem'
  has_many :admin_articles, :class_name => 'Admin::Article'
  has_many :admin_articles_groups, :class_name => 'Admin::ArticlesGroup'
  has_many :admin_files, :class_name => 'Admin::File'
  # has_many :admin_file_document_categories, :class_name => 'Admin::FileDocumentCategory'

  validates :title, presence: { message: "не може бути пустим"},
            uniqueness: { message: "уже зайнято."}

  def self.parent_roles
    where(:title.nin => [/#{"/"}/]).collect {|x| [x.title, x.id]}
  end

  def self.take_title(role_ask)
    where(title: role_ask).first
  end

  def is_admin?
    title.eql?("admin")
  end

  def is_manager?
    title.eql?("manager")
  end

  def is_admin_or_manager?
    title.eql?("admin") || title.eql?("manager")
  end
end
