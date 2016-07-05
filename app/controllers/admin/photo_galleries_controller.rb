class Admin::PhotoGalleriesController < Admin::AdminController
  before_action :set_admin_photo_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @admin_photo_galleries = Admin::PhotoGallery.order(created_at: :desc).page(params[:page]).per(25)
  end

  def show
    @photo = Photo.new
  end

  def new
    @admin_photo_gallery = Admin::PhotoGallery.new
  end

  def edit
  end

  def create
    @admin_photo_gallery = Admin::PhotoGallery.new(admin_photo_gallery_params)

    respond_to do |format|
      if @admin_photo_gallery.save
        format.html { redirect_to @admin_photo_gallery, notice: 'Photo gallery was successfully created.' }
        format.json { render :show, status: :created, location: @admin_photo_gallery }
      else
        format.html { render :new }
        format.json { render json: @admin_photo_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_photo_gallery.update(admin_photo_gallery_params)
        format.html { redirect_to @admin_photo_gallery, notice: 'Photo gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_photo_gallery }
      else
        format.html { render :edit }
        format.json { render json: @admin_photo_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_photo_gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_photo_galleries_url, notice: 'Photo gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_photo_gallery
      @admin_photo_gallery = Admin::PhotoGallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_photo_gallery_params
      params.require(:admin_photo_gallery).permit(:title, :description, :publish_on)
    end
end
