class Admin::Poll
  include Mongoid::Document
  field :question, type: String
  field :publish_on, type: Boolean
  field :order_question, type: Integer
  # abort order_question.inspect
  # validates_presence_of :question
  validates :question,  length: { minimum: 3, maximum: 120, message: "(Заголовок): мінімально 3, максимально 120 символів."}

  embeds_many :replies, class_name: 'Reply'

  def self.count_plus? poll
    @poll = self.find(poll.id)
    iter = 0
    @poll.replies.each do |reply|
      iter = iter + reply.count_answer.to_i
    end
    iter > 0
  end

end

class Reply
  include Mongoid::Document
  field :answer, type: String
  field :name, type: String
  field :value, type: String
  field :order_answer, type: Integer
  field :count_answer, type: Integer

  # validates :answer,  length: { minimum: 3, maximum: 120, message: "(Заголовок): мінімально 3, максимально 120 символів."} #, presence: { message: "не може бути пустим"}
  # validates_presence_of :answer
  # validates :answer,  length: { minimum: 1, maximum: 80}

  embedded_in :admin_question, class_name: 'Admin::Poll', :inverse_of => :replies
end
