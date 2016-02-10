class Admin::NewsController < ApplicationController
  layout 'application_admin'

  def index
    @news = Admin::News.all
  end

  def show
    @news = Admin::News.find(params[:id])
  end

  def new
    @news = Admin::News.new
  end

  def edit
    @news = Admin::News.find(params[:id])
  end

  def create
    @news = Admin::News.new(news_params)

    respond_to do |format|
      if @news.save
        # if :require_admin
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render action: 'show', status: :created, location: @news }
        # else
        #   session[:user_id] = @user.id
        #   format.html { render action: 'users', notice: 'User was successfully created!!!' }
        #   format.json { render action: '/', status: :created, location: @user }
        # end
      else
        format.html { render action: 'new' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
    # if @user.save
    #   #session[:user_id] = @user.id
    #   redirect_to @user #'/users'
    # else
    #   #redirect_to '/users/new'
    # end
  end

  def update
    @news = Admin::News.find(params[:id])

    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @news }
      else
        format.html { render action: 'edit' }
        format.json { render json: @news.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @news = Admin::News.find(params[:id])
    @news.destroy

    redirect_to admin_news_index_path
  end

  def news_test
    jk = "YYYYIKY"
  end
  private

  def news_params
    params.require(:admin_news).permit(:title, :pre_text, :description, :publish_on, :publish_up, :publish_down, :image)
  end
end
