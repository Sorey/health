class Admin::Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :title_english, type: String
  field :publish_on, type: Boolean
  field :meta_keywords, type: String
  field :meta_description, type: String
  field :description, type: String

  # field :meta_title, type: String

  belongs_to :admin_articles_group, :class_name => 'Admin::ArticlesGroup'
  belongs_to :admin_role, :class_name => 'Admin::Role'

  validates :title,  length: { minimum: 5, maximum: 200, message: "(Заголовок): мінімально 5, максимально 200 символів."} #, presence: { message: "не може бути пустим"}
  validates :title_english, presence: { message: "не може бути пустим"},
            uniqueness: { message: "уже зайнято."},
            format: { with:  /\A[a-zA-Z0-9_-]+\z/, message: "лише латинські літери без пробілів!"},
            length: { minimum: 3, maximum: 50, message: "мінімально 3, максимально 50 символів."}

  validates :meta_keywords, :allow_blank => true, length: { minimum: 3, maximum: 160, message: "(Ключові слова): мінімально 3, максимально 150 символів."}
  validates :meta_description, :allow_blank => true, length: { minimum: 5, maximum: 250, message: "(Опис для пошуку): мінімально 5, максимально 250 символів."}
  validates :description, presence: { message: "(Тіло статті) не може бути пустим"}

  def self.get_articles user_role
    if user_role.is_admin? || user_role.is_manager?
      all
    else
      where(:admin_role_id => user_role)
    end
  end

  def self.get_header_numbers
    where(title_english: "header-numbers").first
  end
  def self.get_footer_contacts
    where(title_english: "footer_contacts").first
  end
  def self.get_footer_navigation
    where(title_english: "footer-navigation").first
  end
end
