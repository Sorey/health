class Admin::MenuItem
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :type_level, type: String
  field :type_item, type: String
  field :parent_id, type: String
  field :link, type: String
  field :target, type: String
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

  has_many :children, class_name: "Admin::MenuItem" #, foreign_key: "parent_id"
  belongs_to :parent, class_name: "Admin::MenuItem"
  after_save :reload_routes


  validates :title,  length: { minimum: 3, maximum: 120, message: "(Заголовок): мінімально 3, максимально 120 символів."} #, presence: { message: "не може бути пустим"}
  validates_format_of :link, :allow_blank => true, :with => /\A[\S]+\z/, message: "повинен бути без пробілів."
  validates :alias, :allow_blank => true,
            uniqueness: { message: "уже зайнято."},
            format: { with:  /\A[a-zA-Z0-9]+\z/, message: "лише латинські літери без пробілів!"},
            length: { minimum: 3, maximum: 25, message: "мінімально 3, максимально 25 символів."}

  # before_save :set_type_level
  # before_create :get_level
  # before_update :get_level

  # def set_type_level
  #   type_menu = ['Заголовок меню', 'Пункт меню', 'Перший рівень', 'Додатковий рівень']
  #   parent = Admin::MenuItem.find(self.parent_id).type_level
  #   # abort parent.inspect
  #
  #   result = case parent
  #              when type_menu[0] then type_menu[1]
  #              when type_menu[1] then type_menu[2]
  #
  #              else "Invalid Score"
  #            end
  # end




  def self.get_alias_links
    get_not_empty = where(:alias.ne =>  '')
    get_not_nil= get_not_empty.any_of({:alias.ne  => nil})
  end

  # def get_level
  #   level = self.parent.type_level if self.parent
  #   # logger.debug level
  #   level = -1 unless self.parent
  #   self.type_level = level.to_i + 1
  # end

  def self.parent_roles
    all.collect{|a| [a.title, a.id]}
  end

  def self.type_items
    all.collect{|a| [a.type_item, a.type_item]}
  end

  def self.get_menu_items
    where(type_item: "header-menu").order(created_at: :desc)
  end

  def reload_routes
    DynamicRouter.reload
  end
end
