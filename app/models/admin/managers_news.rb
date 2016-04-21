class Admin::ManagersNews
  include Mongoid::Document

  include Mongoid::Timestamps
  field :title, type: String
  field :date_start, type: Date
  field :publish_on, type: Mongoid::Boolean
  field :description, type: String

  validates :title,  length: { minimum: 5, maximum: 100, message: "(Назва): мінімально 5, максимально 100 символів."}
  validates :description,  presence: { message: "(Опис): не може бути пустим"}

  # validates :title,  length: { minimum: 5, maximum: 80, message: "мінімально 5, максимально 80 символів."}, presence: { message: "не може бути пустим"}
  # validates :iframe, presence: { message: "не може бути пустим"}, format: { with: /\A<iframe/, message: "не коректний." }
  # validates :description,  length: { minimum: 10, maximum: 1000, message: "мінімально 10, максимально 1000 символів."}, presence: { message: "не може бути пустим"}
end
