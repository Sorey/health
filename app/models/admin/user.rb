# class User
class Admin::User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String

  field :password_digest, :type => String
  has_secure_password

  has_and_belongs_to_many :admin_roles, :class_name => 'Admin::Role'

  def access? (cont, act)
    @admin = 0
    @role_ask = "#{cont}#{act}"
    @role_id_user = self.admin_roles.first.id.to_s if self.admin_roles.first

    @role_admin_user = self.admin_roles.first.parent_id if self.admin_roles.first
    if Admin::Role.take_title(@role_ask)
      @parent_id_role = Admin::Role.take_title(@role_ask).parent_id.to_s
      @parent_id_role = Admin::Role.find(@parent_id_role).parent_id.to_s if @role_id_user != @parent_id_role && @parent_id_role
    end
    # Rails.logger.debug @parent_id_role
    # abort @role_user.inspect
    @role_id_user == @parent_id_role || @role_admin_user == @admin
  end

  def access2? (cont, act)
    @admin = 0
    @role_ask = "#{cont}#{act}"
    @user_role_id = self.admin_roles.first.id.to_s if self.admin_roles.first

    @role_admin_user = self.admin_roles.first.parent_id if self.admin_roles.first
    return true if @role_admin_user == @admin

    if Admin::Role.take_title(@role_ask)
      @parent_id_role = Admin::Role.take_title(@role_ask).parent_id
      return role_true @parent_id_role, @user_role_id
      # @parent_id_role = Admin::Role.find(@parent_id_role).parent_id.to_s if @user_role_id != @parent_id_role && @parent_id_role
    end
    # Rails.logger.debug @parent_id_role
    # abort @role_user.inspect
    # @user_role_id == @parent_id_role #|| @role_admin_user == @admin
  end

  def role_true role, user_role
    u_r = user_role
    parent_id_role = Admin::Role.find(role).parent_id if Admin::Role.find(role).parent_id.to_s.to_i != 0
    if parent_id_role.to_s.to_i != 0
      if u_r == parent_id_role.to_s && parent_id_role
        return true
      else
        # abort @parent_id_role.inspect
        if parent_id_role.to_s.to_i != 0
          role_true parent_id_role, u_r
        end
      end
    end


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

  def access_admin?
    self.admin_roles.first.title == "admin"
  end
end
