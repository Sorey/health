class MenuItem

  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :type_level, type: String
  field :type_item, type: String
  field :parent_id, type: String
  field :link, type: String
  field :show, type: Boolean
  field :description, type: String
  field :order_item, type: Integer

  field :alias, type: String
  field :alias_type, type: String
  field :alias, type: String
  field :id_post, type: String
  field :link_component, type: String
  field :link_description, type: String
  field :meta_title, type: String
  field :meta_description, type: String
  field :meta_keywords, type: String


  has_many :children, class_name: "MenuItem", foreign_key: "parent_id"
  belongs_to :parent, class_name: "MenuItem"
  # after_save :reload_routes
  # before_create :get_level
  # before_update :get_level

  def reload_routes
    # if MenuItem.get_alias_links.count > 0
    DynamicRouter.reload
    # end

  end

  def self.get_alias_links
    # find( { alias: { $ne => "" } } )
    # ff = self.find(
    #     { alias: { $ne: "" } },
    #     { id_post: 1, alias: 1, _id: 0 }
    # )
    # select('id_post, alias').where(show: false)
    # any_of({:alias.ne  => nil}).any_of({:alias.ne  => ""})
    # where(:alias.ne =>  nil)
    where(:alias.ne =>  nil).limit(1)
    # where(:url.ne => "", :url.exists => true)
    # find(show: false)

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
