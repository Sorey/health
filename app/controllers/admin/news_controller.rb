module Admin
  class NewsController < AdminController
    before_action :set_admin_news, only: [:show, :edit, :update, :destroy]

    def index
      @news = News.all.order(updated_at: :desc).page(params[:page]).per(20)
    end

    def show
    end

    def new
      @news = News.new
    end

    def edit
    end

    def create
      @news = News.new(news_params)
      @news.user = current_user
      respond_to do |format|
        if @news.save
          format.html { redirect_to @news, notice: 'Новина успішно створена.' }
          format.json { render action: 'show', status: :created, location: @news }
        else
          format.html { render action: 'new' }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      unless news_params[:title].blank?
        unless news_params[:description].blank?
          unless news_params[:image].blank?
            @news.remove_image!
          end
        end
      end
      respond_to do |format|
        if @news.update(news_params)
          format.html { redirect_to @news, notice: 'Новина успішно оновлена.' }
          format.json { render action: 'show', status: :created, location: @news }
        else
          format.html { render action: 'edit' }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @news.destroy
      respond_to do |format|
        format.html { redirect_to admin_news_index_path, notice: 'Новина успішно видалена.' }
        format.json { head :no_content }
      end
    end

    private

    def set_admin_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:admin_news).permit(:title, :pre_text, :description, :publish_on, :publish_up, :publish_down, :image, :meta_keywords, :meta_description)
    end
  end
end