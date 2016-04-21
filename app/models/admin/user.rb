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
      @parent_id_role = Admin::Role.where(id: @parent_id_role).first.parent_id.to_s if @role_id_user != @parent_id_role && @parent_id_role
    end
    # Rails.logger.debug @parent_id_role
    # abort @role_user.inspect
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

  def access_admin?
    self.admin_roles.first.title == "admin"
  end
end
