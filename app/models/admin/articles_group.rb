class Admin::ArticlesGroup
  include Mongoid::Document

  include Mongoid::Timestamps
  field :title, type: String
  field :title_english, type: String
  field :description, type: String
  field :publish_on, type: Boolean

  has_many :admin_articles, :class_name => 'Admin::Article'
  belongs_to :admin_role, :class_name => 'Admin::Role'

  validates :title,  length: { minimum: 5, maximum: 150, message: "(Заголовок): мінімально 5, максимально 150 символів."} #, presence: { message: "не може бути пустим"}
  validates :title_english, presence: { message: "не може бути пустим"},
            uniqueness: { message: "уже зайнято."},
            format: { with:  /\A[a-zA-Z0-9_-]+\z/, message: "лише латинські літери без пробілів!"},  #, presence: { message: "не може бути пустим"}
            length: { minimum: 3, maximum: 50, message: "мінімально 3, максимально 50 символів."}
  validates :description, :allow_blank => true, length: { minimum: 5, maximum: 300, message: "мінімально 5, максимально 300 символів."}

  def self.get_group?
    self.find_by(title_english: 'regional_programs')
  end

  def self.get_groups_articles user_role
    if user_role.title == "admin"
      all
    else
      where(:admin_role_id => user_role)
    end
  end
end
