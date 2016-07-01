class Admin::ManagersNewsController < Admin::AdminController
  before_action :set_admin_for_manager, only: [:show, :edit, :update, :destroy]

  def index
    @admin_managers_news = Admin::ManagersNews.all.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @admin_managers_news = Admin::ManagersNews.new
  end

  def edit
  end

  def create
    @admin_managers_news = Admin::ManagersNews.new(admin_managers_news_params)

    respond_to do |format|
      if @admin_managers_news.save
        format.html { redirect_to @admin_managers_news, notice: "Новина для керівників успішно створена." }
        format.json { render :show, status: :created, location: @admin_managers_news }
      else
        format.html { render :new }
        format.json { render json: @admin_managers_news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_managers_news.update(admin_managers_news_params)
        format.html { redirect_to @admin_managers_news, notice: "Новина для керівників успішно оновлена." }
        format.json { render :show, status: :ok, location: @admin_managers_news }
      else
        format.html { render :edit }
        format.json { render json: @admin_managers_news.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_managers_news.destroy
    respond_to do |format|
      format.html { redirect_to admin_managers_news_index_url, notice: "Новина для керівників успішно видалена." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_for_manager
      @admin_managers_news = Admin::ManagersNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_managers_news_params
      params.require(:admin_managers_news).permit(:title, :date_start, :publish_on, :description)
    end
end
