class InterrogationController < ApplicationController
  def get_reply
    abort params.inspect
    redirect_to root_url, notice: 'Ваше повідомлення відправлено.'
  end
end