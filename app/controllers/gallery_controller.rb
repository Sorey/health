class GalleryController < ApplicationController

  def galleries
  end

  def show
      @name_gallery = params[:gallery] ||= "Картограмми"
      @images = Dir.glob("app/assets/images/statistic_gallery/#{@name_gallery}/*.jpg")
  end
end