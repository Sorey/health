# class User
class Admin::User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  include Mongoid::Timestamps
  field :name, type: String
  field :full_name, type: String
  field :email, type: String

  field :password_digest, :type => String
  has_secure_password

  has_and_belongs_to_many :admin_roles, :class_name => 'Admin::Role'

  def access2? (cont, act)
    @admin_parent_id = 0
    @role_ask = "#{cont}#{act}"
    @role_id_user = self.admin_roles.first.id if self.admin_roles.first

    @user_role_parent_id = self.admin_roles.first.parent_id if self.admin_roles.first
    if Admin::Role.take_title(@role_ask)
      @parent_role_id = Admin::Role.take_title(@role_ask).parent_id
      @parent_role_id = Admin::Role.find(@parent_role_id).parent_id if @role_id_user != @parent_role_id && @parent_role_id
    end
    @role_id_user == @parent_role_id || @user_role_parent_id == @admin_parent_id
  end

  def access? (cont, act)
    @admin_parent_id = 0
    @role_ask = "#{cont}#{act}"
    @user_role_id = self.admin_roles.first.id if self.admin_roles.first

    @user_role_parent_id = self.admin_roles.first.parent_id if self.admin_roles.first
    # binding.pry
    return true if @user_role_parent_id == @admin_parent_id

    if Admin::Role.take_title(@role_ask)
      @parent_role_id = Admin::Role.take_title(@role_ask).parent_id
      # binding.pry
      if @parent_role_id == @user_role_id
        return true
      else
        return role_true @parent_role_id, @user_role_id
      end
      # @parent_id_role = Admin::Role.find(@parent_id_role).parent_id.to_s if @user_role_id != @parent_id_role && @parent_id_role
    end
  end

  def role_true role_id, user_role_id
    parent_role_id = Admin::Role.find(role_id).parent_id
    # binding.pry
    if parent_role_id != 0
      if user_role_id == parent_role_id && parent_role_id
        return true
      else
        if parent_role_id != 0
          role_true parent_role_id, user_role_id
        else
          return false
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
  #     @true = r.title if r.is_admin?
  #   end
  #   @true == 'admin'
  # end

  def is_admin?
    self.admin_roles.first.is_admin?
  end

  def is_manager?
    self.admin_roles.first.is_manager?
  end
end
