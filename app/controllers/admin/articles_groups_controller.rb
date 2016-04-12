module Admin
  class ArticlesGroupsController < ApplicationController
    before_action :authorize
    before_action :require_role
    before_action :set_articles_group, only: [:show, :edit, :update, :destroy]
    layout 'application_admin'

    # GET /articles_groups
    # GET /articles_groups.json
    def index
      @articles_groups = Admin::ArticlesGroup.all
    end

    # GET /articles_groups/1
    # GET /articles_groups/1.json
    def show
    end

    # GET /articles_groups/new
    def new
      @articles_group = Admin::ArticlesGroup.new
    end

    # GET /articles_groups/1/edit
    def edit
    end

    # POST /articles_groups
    # POST /articles_groups.json
    def create
      @articles_group = Admin::ArticlesGroup.new(articles_group_params)

      respond_to do |format|
        if @articles_group.save
          format.html { redirect_to @articles_group, notice: 'Articles group was successfully created.' }
          format.json { render :show, status: :created, location: @articles_group }
        else
          format.html { render :new }
          format.json { render json: @articles_group.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /articles_groups/1
    # PATCH/PUT /articles_groups/1.json
    def update
      respond_to do |format|
        if @articles_group.update(articles_group_params)
          format.html { redirect_to @articles_group, notice: 'Articles group was successfully updated.' }
          format.json { render :show, status: :ok, location: @articles_group }
        else
          format.html { render :edit }
          format.json { render json: @articles_group.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /articles_groups/1
    # DELETE /articles_groups/1.json
    def destroy
      @articles_group.destroy
      respond_to do |format|
        format.html { redirect_to articles_groups_url, notice: 'Articles group was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_articles_group
        @articles_group = Admin::ArticlesGroup.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def articles_group_params
        params.require(:admin_articles_group).permit(:title,:title_english, :description, :publish_on)
      end
  end
end