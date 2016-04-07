class InterrogationController < ApplicationController
  def get_reply
    # abort params.inspect
    @question = Admin::Poll.find(params[:question])
    @reply = @question.replies.find(params[:reply]).inc(count_answer:1) unless ip_address_old?
    @reply2 = @question.replies.find(params[:reply])
    cookies[:user] = request.remote_ip unless cookies[:user]
    cookies[params[:question]] = params[:question] unless cookies[params[:question]]
    # abort request.remote_ip.inspect
    # abort cookies[:user].inspect
    # abort cookies.inspect
    redirect_to root_url, notice: @reply2
  end
  def ip_address_old?
    request.remote_ip == cookies[:user] && cookies[params[:question]] == params[:question]
  end
end