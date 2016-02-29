class MenuItem < ActiveRecord::Base
  has_many :children, class_name: "MenuItem", foreign_key: "parent_id"
  belongs_to :parent, class_name: "MenuItem"

  def self.parent_roles
    all.collect{|a| [a.title, a.id]}
  end

  def self.type_items
    all.collect{|a| [a.type_item, a.type_item]}
  end

  def self.get_menu_items
    where(type_item: "header-menu").order(created_at: :desc)
    # def ddd
    #   @m_1.each |:title, :id| do
    #
    # end
    # end
  end
end
