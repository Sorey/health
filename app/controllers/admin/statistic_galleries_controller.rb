class Admin::StatisticGalleriesController < ApplicationController
  before_action :set_admin_statistic_gallery, only: [:show, :edit, :update, :destroy]

  # GET /admin/statistic_galleries
  # GET /admin/statistic_galleries.json
  def index
    @admin_statistic_galleries = Admin::StatisticGallery.all
  end

  # GET /admin/statistic_galleries/1
  # GET /admin/statistic_galleries/1.json
  def show
    binding.pry
  end

  # GET /admin/statistic_galleries/new
  def new
    @admin_statistic_gallery = Admin::StatisticGallery.new
  end

  # GET /admin/statistic_galleries/1/edit
  def edit
  end

  # POST /admin/statistic_galleries
  # POST /admin/statistic_galleries.json
  def create
    @admin_statistic_gallery = Admin::StatisticGallery.new(admin_statistic_gallery_params)

    respond_to do |format|
      if @admin_statistic_gallery.save
        format.html { redirect_to @admin_statistic_gallery, notice: 'Statistic gallery was successfully created.' }
        format.json { render :show, status: :created, location: @admin_statistic_gallery }
      else
        format.html { render :new }
        format.json { render json: @admin_statistic_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/statistic_galleries/1
  # PATCH/PUT /admin/statistic_galleries/1.json
  def update
    respond_to do |format|
      if @admin_statistic_gallery.update(admin_statistic_gallery_params)
        format.html { redirect_to @admin_statistic_gallery, notice: 'Statistic gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_statistic_gallery }
      else
        format.html { render :edit }
        format.json { render json: @admin_statistic_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/statistic_galleries/1
  # DELETE /admin/statistic_galleries/1.json
  def destroy
    @admin_statistic_gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_statistic_galleries_url, notice: 'Statistic gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_statistic_gallery
      @admin_statistic_gallery = Admin::StatisticGallery.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_statistic_gallery_params
      params.require(:admin_statistic_gallery).permit(:title, :publish_on, :meta_keywords, :meta_description, :description, :statistic_gallery => [])
    end
end
