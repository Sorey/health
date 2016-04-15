class VideosController < ApplicationController
  def all_videos
    @videos = Admin::Video.where(publish_on: true).order(created_at: :desc)
  end

  def show_one_video
    @video = Admin::Video.find(params[:id])
  end
end
