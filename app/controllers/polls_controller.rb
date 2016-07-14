class PollsController < ApplicationController
  def get_reply
    @polls = Admin::Poll.where(publish_on: true).order(order_question: :asc)
    @question = Admin::Poll.find(params[:question])
    unless params[:reply].nil?
      @reply = @question.replies.find(params[:reply]).inc(count_answer:1) unless ip_address_old?

      cookies[:user] = { :value => request.remote_ip, :expires => 1.year.from_now } unless cookies[:user]
      cookies[params[:question]] = { :value => params[:question], :expires => 1.year.from_now } unless cookies[params[:question]]

      message = 'Ваш голос враховано!'
    else
      message = 'Ви не обрали відповідь!'
    end
    respond_to do |format|
      format.js{ flash.now[:notice] = message}
      format.html{redirect_to root_path, location: poll}
    end

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