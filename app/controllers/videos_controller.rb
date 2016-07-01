class VideosController < ApplicationController
  def all_videos
    @videos = Admin::Video.where(publish_on: true).order(created_at: :desc).page(params[:page]).per(20)
    set_title_page "Відеоматеріали Департаменту охорони здоров'я"
  end

  def show_one_video
    @video = Admin::Video.find(params[:id])
    set_title_page @video.title
  end
end
