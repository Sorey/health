class MessageController < ApplicationController
  def create
    # abort params[:name].inspect
    # abort request.host_with_port.inspect
    MessageMailer.new_message(params).deliver
    redirect_to root_url
  end
end