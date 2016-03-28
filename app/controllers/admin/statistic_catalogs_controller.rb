class Admin::StatisticCatalogsController < ApplicationController
  before_action :set_admin_statistic_catalog, only: [:show, :edit, :update, :destroy]

  # GET /admin/statistic_catalogs
  # GET /admin/statistic_catalogs.json
  def index
    @admin_statistic_catalogs = Admin::StatisticCatalog.all
  end

  # GET /admin/statistic_catalogs/1
  # GET /admin/statistic_catalogs/1.json
  def show
  end

  # GET /admin/statistic_catalogs/new
  def new
    @admin_statistic_catalog = Admin::StatisticCatalog.new
  end

  # GET /admin/statistic_catalogs/1/edit
  def edit
  end

  # POST /admin/statistic_catalogs
  # POST /admin/statistic_catalogs.json
  def create
    # abort statistic_catalog_params.inspect
    @admin_statistic_catalog = Admin::StatisticCatalog.new(statistic_catalog_params)

    respond_to do |format|
      if @admin_statistic_catalog.save
        format.html { redirect_to @admin_statistic_catalog, notice: 'Statistic catalog was successfully created.' }
        format.json { render :show, status: :created, location: @admin_statistic_catalog }
      else
        format.html { render :new }
        format.json { render json: @admin_statistic_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/statistic_catalogs/1
  # PATCH/PUT /admin/statistic_catalogs/1.json
  def update
    # abort statistic_catalog_params.inspect
    respond_to do |format|
        # abort statistic_catalog_params[:images].shift.inspect
        # data= statistic_catalog_params[:images].shift.inspect
        # @admin_statistic_catalog = Admin::StatisticCatalog.new(statistic_catalog_params)

        # abort @admin_statistic_catalog.inspect
      if @admin_statistic_catalog.update(statistic_catalog_params)

        format.html { redirect_to @admin_statistic_catalog, notice: 'Statistic catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_statistic_catalog }
      else
        format.html { render :edit }
        format.json { render json: @admin_statistic_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/statistic_catalogs/1
  # DELETE /admin/statistic_catalogs/1.json
  def destroy
    @admin_statistic_catalog.destroy
    respond_to do |format|
      format.html { redirect_to admin_statistic_catalogs_url, notice: 'Statistic catalog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_statistic_catalog
      @admin_statistic_catalog = Admin::StatisticCatalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statistic_catalog_params
      params.require(:admin_statistic_catalog).permit(:name, {images: []})
      # params.fetch(:admin_statistic_catalog, {})
    end
end
