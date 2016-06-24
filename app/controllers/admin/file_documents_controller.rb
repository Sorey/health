class Admin::FileDocumentsController < Admin::AdminController
  before_action :set_admin_file_document, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  # GET /admin/file_documents
  # GET /admin/file_documents.json
  def index
    # @admin_file_documents = Admin::FileDocument.all
    # params[:file_document_category] ||= session[:file_document_category]
    @admin_file_document_category = Admin::FileDocumentCategory.find_by(url_title: params[:file_document_category] ||= session[:file_document_category])
    session[:file_document_category] = params[:file_document_category]
    session[:file_document_category_title] = @admin_file_document_category.title
    session[:file_document_category_id] = @admin_file_document_category.id.to_s

    @admin_file_documents = Admin::FileDocument.where(admin_file_document_category_ids: @admin_file_document_category.id)
    @admin_file_documents = @admin_file_documents.order(sort_column + " " + sort_direction)
    @admin_file_documents = @admin_file_documents.page(params[:page]).per(25)

    respond_to do |format|
      format.js
      format.html
    end
  end
  # GET /admin/file_documents/1
  # GET /admin/file_documents/1.json
  def show
  end

  # GET /admin/file_documents/new
  def new
    @admin_file_document = Admin::FileDocument.new
    @admin_file_document.admin_file_document_category_ids.push(params[:file_document_category])
  end

  # GET /admin/file_documents/1/edit
  def edit
  end

  # POST /admin/file_documents
  # POST /admin/file_documents.json
  def create
    @admin_file_document = Admin::FileDocument.new(admin_file_document_params)

    respond_to do |format|
      if @admin_file_document.save
        format.html { redirect_to @admin_file_document, notice: 'Документ успішно створений.' }
        format.json { render :show, status: :created, location: @admin_file_document }
      else
        format.html { render :new }
        format.json { render json: @admin_file_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/file_documents/1
  # PATCH/PUT /admin/file_documents/1.json
  def update
    unless admin_file_document_params[:file].blank?
      @admin_file_document.remove_file!
    end
    respond_to do |format|
      if @admin_file_document.update(admin_file_document_params)
        format.html { redirect_to @admin_file_document, notice: 'Документ успішно оновлений.' }
        format.json { render :show, status: :ok, location: @admin_file_document }
      else
        format.html { render :edit }
        format.json { render json: @admin_file_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/file_documents/1
  # DELETE /admin/file_documents/1.json
  def destroy
    @admin_file_document.destroy
    respond_to do |format|
      format.html { redirect_to admin_file_documents_url, notice: 'Документ видалено.' }
      format.json { head :no_content }
    end
  end

  private

    def sort_column
      Admin::FileDocument.fields.keys.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_file_document
      @admin_file_document = Admin::FileDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_file_document_params
      # params.fetch(:admin_file_document, {})
      params.require(:admin_file_document).permit(:title, :year_publish , :file, admin_file_document_category_ids: [])
    end
end
