class InterrogationController < ApplicationController
  def get_reply
    # abort params.inspect

    @question = Admin::Poll.find(params[:question])
    unless params[:reply].nil?
      @reply = @question.replies.find(params[:reply]).inc(count_answer:1) unless ip_address_old?
      # cookies[:user] = request.remote_ip unless cookies[:user]
      # cookies[params[:question]] = params[:question] unless cookies[params[:question]]

      cookies[:user] = { :value => request.remote_ip, :expires => 1.year.from_now } unless cookies[:user]
      cookies[params[:question]] = { :value => params[:question], :expires => 1.year.from_now } unless cookies[params[:question]]
      redirect_to root_url, notice: 'Ваш голос враховано!'
    else
      redirect_to root_url, notice: 'Ви не обрали відповідь!'
    end


      # abort request.remote_ip.inspect
    # abort cookies[:user].inspect
    # abort cookies.inspect

  end

  def show_chart
    @poll = Admin::Poll.find(params[:id])

    @poll_array = [['Task', 'Hours per Day']]
    @poll.replies.each do |reply|
      array = [reply.answer, reply.count_answer.nil? ? 0 : reply.count_answer]
      @poll_array.push(array)
    end
    set_title_page @poll.question
    @poll_array
  end

  def ip_address_old?
    request.remote_ip == cookies[:user] && cookies[params[:question]] == params[:question]
  end
end