class MessageMailer < ApplicationMailer
  def new_message(message)
    # @message = message
    @message = message
    # abort @message.inspect
    mail to: @message[:email],
         subject: "New Message '#{@message[:name]}'"
    # mail to: @message.email,
    #      subject: "New Message '#{@message.name}'"
  end
end
