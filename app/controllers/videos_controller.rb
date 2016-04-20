class VideosController < ApplicationController
  def all_videos
    @videos = Admin::Video.where(publish_on: true).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show_one_video
    @video = Admin::Video.find(params[:id])
  end
end
