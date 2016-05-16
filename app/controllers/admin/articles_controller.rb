module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    around_filter :catch_not_found

    helper_method :sort_column, :sort_direction
    # GET /articles
    # GET /articles.json
    def index
      @articles1 = Admin::Article.order(sort_column + " " + sort_direction)
      @articles1 = @articles1.where(:admin_articles_group.in => params["group_select"]) unless params["group_select"].blank?
      @articles = @articles1.page(params[:page]).per(35)

      respond_to do |format|
        format.js
        format.html
      end

    end

    # GET /articles/1
    # GET /articles/1.json
    def show
    end

    def show_front_page

    end

    # GET /articles/new
    def new
      @article = Admin::Article.new
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    # POST /articles.json
    def create
      @article = Admin::Article.new(article_params)

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Стаття успішно створена.' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /articles/1
    # PATCH/PUT /articles/1.json
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Стаття успішно оновлена.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /articles/1
    # DELETE /articles/1.json
    def destroy
      @article.destroy
      respond_to do |format|
        format.html { redirect_to admin_articles_url, notice: 'Стаття успішно видалена.' }
        format.json { head :no_content }
      end
    end

    private

      def sort_column
        Admin::Article.fields.keys.include?(params[:sort]) ? params[:sort] : "admin_articles_group_id"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end

      def catch_not_found
        yield
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url, :flash => { :error => "Сторінки не існує." }
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        # render_404 unless params[:id]
        # render_404 and return if params[:id].blank?
        @article = Admin::Article.find(params[:id])

        # begin
        #   # @userEvents = current_user.event
        #   @article = Article.find(params[:id])
        # rescue ActiveRecord::RecordNotFound
        #   render file: "#{Rails.root}/public/404.html", layout: false, status: 404
        #   return
        # end
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def article_params
        params.require(:admin_article).permit(:title,:title_english, :description, :publish_on, :admin_articles_group_id, :meta_description, :meta_keywords)
      end
  end
end