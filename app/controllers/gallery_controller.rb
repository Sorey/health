class GalleryController < ApplicationController
  def galleries

  end

  def show
      @name_gallery = params[:gallery] ||= "Картограмми"
      @images = Dir.glob("app/assets/images/statistic_gallery/#{@name_gallery}/*.jpg")
      # respond_to do |format|
      #   format.html { render :show }
      # end
      # format.html { redirect_to gallery_url(@images) }
      # if @admin_statistic_catalog.update(statistic_catalog_params)
      #
      #   format.html { redirect_to @admin_statistic_catalog, notice: 'Statistic catalog was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @admin_statistic_catalog }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @admin_statistic_catalog.errors, status: :unprocessable_entity }
      # end
  end
end