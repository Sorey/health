class User < ActiveRecord::Base
  has_secure_password

  def access? (cont, act)
    @admin = 0
    @role_ask = "#{cont}#{act}"
    @role_id_user = self.roles.first.id if self.roles.first
    @role_admin_user = self.roles.first.parent_id if self.roles.first
    if Role.take_title(@role_ask)
      @parent_id_role = Role.take_title(@role_ask).parent_id
      @parent_id_role = Role.where(id: @parent_id_role).take.parent_id if @role_id_user != @parent_id_role
    end
    # # Rails.logger.debug @role_user
    # # abort @role_user.inspect
    @role_id_user == @parent_id_role || @role_admin_user == @admin
  end
  # def editor?
  #   @roles = self.roles
  #   @roles.each do |r|
  #     @true = r.title if r.title == 'Editor'
  #   end
  #   @true == 'Editor'
  # end
  #
  # def admin?
  #   @roles = self.roles
  #   @roles.each do |r|
  #     @true = r.title if r.title == 'admin'
  #   end
  #   @true == 'admin'
  # end

  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  accepts_nested_attributes_for :user_roles

  has_many :news
end
