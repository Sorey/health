class GalleryController < ApplicationController

  def statistic_galleries
    set_title_page "Основні показники діяльності охорони здоров'я"
  end

  def show_statistic_gallery
      @name_gallery = params[:gallery] ||= "charts"
      @title = @name_gallery == "charts" ? "Основні показники діяльності охорони здоров'я за 2010-2015 роки" : "Основні показники діяльності охорони здоров'я за 2015 рік"
      @images = Dir.glob("app/assets/images/statistic_gallery/#{@name_gallery}/*.jpg").sort

      # @images =  @images.page(params[:page]).per(10)
      @images = Kaminari.paginate_array(@images).page(params[:page]).per(33)

      set_title_page @title

      respond_to do |format|
        format.js
        format.html
      end
  end

  def photo_galleries
    @photo_galleries = Admin::PhotoGallery.where(publish_on: true).order(created_at: :desc)
    @photo_galleries = @photo_galleries.page(params[:page]).per(28)
    set_title_page "Фотоматеріали Департаменту охорони здоров'я"
  end

  def show_photo_gallery
    @photo_gallery = Admin::PhotoGallery.find(params[:id])
    # @photo_gallery = @photo_gallery.page(params[:page]).per(10)
    # @photo_gallery = Kaminari.paginate_array(@photo_gallery.photos).page(params[:page]).per(33)

    set_title_page @photo_gallery.title
    respond_to do |format|
      format.js
      format.html
    end
  end
end