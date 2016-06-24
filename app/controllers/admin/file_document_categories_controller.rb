class Admin::FileDocumentCategoriesController < Admin::AdminController
  before_action :set_admin_file_document_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/file_document_categories
  # GET /admin/file_document_categories.json
  def index
    @admin_file_document_categories = Admin::FileDocumentCategory.all
  end

  # GET /admin/file_document_categories/1
  # GET /admin/file_document_categories/1.json
  def show
  end

  # GET /admin/file_document_categories/new
  def new
    @admin_file_document_category = Admin::FileDocumentCategory.new
  end

  # GET /admin/file_document_categories/1/edit
  def edit
  end

  # POST /admin/file_document_categories
  # POST /admin/file_document_categories.json
  def create
    @admin_file_document_category = Admin::FileDocumentCategory.new(admin_file_document_category_params)

    respond_to do |format|
      if @admin_file_document_category.save
        format.html { redirect_to admin_file_document_categories_url, notice: 'File document category was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @admin_file_document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/file_document_categories/1
  # PATCH/PUT /admin/file_document_categories/1.json
  def update
    respond_to do |format|
      if @admin_file_document_category.update(admin_file_document_category_params)
        format.html { redirect_to admin_file_document_categories_url, notice: 'File document category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @admin_file_document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/file_document_categories/1
  # DELETE /admin/file_document_categories/1.json
  def destroy
    @admin_file_document_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_file_document_categories_url, notice: 'File document category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list_categories
    @admin_file_document_categories = Admin::FileDocumentCategory.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_file_document_category
      @admin_file_document_category = Admin::FileDocumentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_file_document_category_params
      # params.fetch(:admin_file_document_category, {})
      params.require(:admin_file_document_category).permit(:title, :url_title, :admin_role_id)
    end
end
