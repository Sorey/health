class MessageMailer < ApplicationMailer
  def new_message(message)
    email = "health2016vin@gmail.com"
    @message = message
    # abort @message.inspect
    mail to: email,
         subject: "ДОЗ '#{@message[:theme]}'"
  end
end
