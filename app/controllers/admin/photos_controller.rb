class Admin::PhotosController < Admin::AdminController
  before_action :set_photo_gallery

  def create
    respond_to do |format|
      if @admin_photo_gallery.photos.create!(photo_params)
        format.html { redirect_to @admin_photo_gallery, :notice => "Фото додано!"}
        format.json { render :show, status: :ok, location: @admin_photo_gallery }
      else
        @photo = @admin_photo_gallery.photos.find(params[:id])
        format.html { render 'admin/polls/show', :notice => "Фото додано."}
        format.json { render json: @photo.errors, status: :unprocessable_entity, location: [@admin_photo_gallery, @photo] }
      end
    end
  end

  def edit
    @photo = @admin_photo_gallery.photos.find(params[:id])
  end

  def update
    respond_to do |format|
      if @admin_photo_gallery.photos.find(params[:id]).update(photo_params)
        format.html { redirect_to @admin_photo_gallery, :notice => "Фото оновлено!" }
        format.json { render :show, status: :ok, location: @admin_photo_gallery }
      else
        @photo = @admin_photo_gallery.photos.find(params[:id])
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity, location: [@admin_photo_gallery, @photo] }
      end
    end
  end

  def destroy
    @admin_photo_gallery.photos.find(params[:id]).destroy
    redirect_to @admin_photo_gallery, :notice => "Фото видалено!"
  end

  def sort
    params[:order].each do |key,value|
      @admin_photo_gallery.photos.find(value[:id]).update_attribute(:order_photo,value[:position])
    end
    render :nothing => true
  end

  private

    def set_photo_gallery
      @admin_photo_gallery = Admin::PhotoGallery.find(params[:photo_gallery_id])
    end

    def photo_params
      params.require(:photo).permit(:title, :order_photo, :image)
    end
end
