class MessageController < ApplicationController
  def create
    # abort params.inspect
    # abort request.host_with_port.inspect

    MessageMailer.default_url_options[:host] = request.host_with_port
    MessageMailer.new_message(params).deliver
    format.html {redirect_to root_url, notice: 'Ваше повідомлення відправлено.'}

    # format.html { redirect_to root_url, notice: 'Ваше повідомлення відправлено.' }
    # format.json { render root_url, notice: 'Ваше повідомлення відправлено!' }
  end
end