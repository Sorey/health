module Admin
  class ArticlesGroupsController < AdminController
    skip_before_action :require_role
    before_action :set_articles_group, only: [:show, :edit, :update, :destroy]

    def index
      @articles_groups = Admin::ArticlesGroup.get_groups_articles current_user.admin_roles.first
    end

    def show
    end

    def new
      @articles_group = Admin::ArticlesGroup.new
    end

    def edit
    end

    def create
      @articles_group = Admin::ArticlesGroup.new(articles_group_params)
      @articles_group.admin_role = current_user.admin_roles.first

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

    def destroy
      @articles_group.destroy
      respond_to do |format|
        format.html { redirect_to admin_articles_groups_url, notice: 'Articles group was successfully destroyed.' }
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