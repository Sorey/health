class Admin::PhotosController < Admin::AdminController
  before_action :set_photo

  def create
    respond_to do |format|
      if @admin_photo_gallery.photos.create!(photo_params)
        format.html { redirect_to @admin_photo_gallery, :notice => "Відповідь створена!"}
        format.json { render :show, status: :ok, location: @admin_photo_gallery }
      else
        @photo = @admin_photo_gallery.photos.find(params[:id])
        format.html { render 'admin/polls/show', :notice => "Відповідь створена."}
        format.json { render json: @photo.errors, status: :unprocessable_entity, location: [@admin_photo_gallery, @photo] }
      end
    end
  end

  def edit
    # binding.pry
    @admin_photo_gallery = Admin::PhotoGallery.find(params[:photo_gallery_id])
    @photo = @admin_photo_gallery.photos.find(params[:id])
  end

  def update
    respond_to do |format|
      if @admin_photo_gallery.photos.find(params[:id]).update(photo_params)
        format.html { redirect_to @admin_photo_gallery, :notice => "Відповідь оновлена!" }
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
    redirect_to @admin_photo_gallery, :notice => "Відповідь видалена!"
  end

  private

  def set_photo
    # binding.pry
    @admin_photo_gallery = Admin::PhotoGallery.find(params[:photo_gallery_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :order_photo, :image)
  end
end
