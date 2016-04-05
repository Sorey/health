class RepliesController < ApplicationController

  def create
    @test = Test.find(params[:test_id])
    # abort params[:reply].inspect
    @reply = @test.replies.create!(user_params)
    redirect_to @test, :notice => "Comment created!"
  end

  private

  def user_params
    params.require(:reply).permit(:answer)
  end
end
