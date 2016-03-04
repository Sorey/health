class MenuItem < ActiveRecord::Base
  has_many :children, class_name: "MenuItem", foreign_key: "parent_id"
  belongs_to :parent, class_name: "MenuItem"
  after_save :reload_routes
  # before_create :get_level
  # before_update :get_level

  def reload_routes
    DynamicRouter.reload
  end
  def self.get_alias_links
    select('id_post, alias').where.not( alias: "", show: false)
    # ggg = 'http'
    # where("link like ?", "%#{ggg}%").to_sql
    # where{:link.matches '%http%'}
    # where("link LIKE ?" , "%#{ggg}%")
  end

  def get_level
    level = self.parent.type_level if self.parent
    # logger.debug level
    level = -1 unless self.parent
    self.type_level = level.to_i + 1
   end

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
