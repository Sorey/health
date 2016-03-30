class GalleryController < ApplicationController

  def galleries
  end

  def show
      @name_gallery = params[:gallery] ||= "charts"
      @title = @name_gallery == "charts" ? "Основні показники діяльності охорони здоров'я за 2010-2015 роки" : "Основні показники діяльності охорони здоров'я за 2015 рік"
      @images = Dir.glob("app/assets/images/statistic_gallery/#{@name_gallery}/*.jpg").sort

      # @images =  @images.page(params[:page]).per(10)
      @images =Kaminari.paginate_array(@images).page(params[:page]).per(33)

      respond_to do |format|
        format.js
        format.html
      end
  end
end