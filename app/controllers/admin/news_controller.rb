module Admin
  class NewsController < ApplicationController
    before_action :authorize
    before_action :require_role
    layout 'application_admin'

    def index
      @news = News.all.order(updated_at: :desc)
    end

    def show
      @news = News.find(params[:id])
    end

    def new
      @news = News.new
    end

    def edit
      @news = News.find(params[:id])
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
      @news = News.find(params[:id])

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
      @news = News.find(params[:id])
      @news.destroy

      redirect_to admin_news_index_path
    end

  private

    def news_params
      params.require(:admin_news).permit(:title, :pre_text, :description, :publish_on, :publish_up, :publish_down, :image)
    end
  end
end