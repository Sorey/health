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

  validates :name, presence: { message: "не може бути пустим"},
            uniqueness: { message: "уже зайнято."}

  def access? (cont, act)
    # if role admin
    @admin_parent_id = 0
    @user_role_parent_id = self.admin_roles.first.parent_id if self.admin_roles.first
    return true if @user_role_parent_id == @admin_parent_id

    # if role not admin
    @role_ask = "#{cont}#{act}"
    @user_role_id = self.admin_roles.first.id if self.admin_roles.first

    if Admin::Role.take_title(@role_ask)
      @parent_role_id = Admin::Role.take_title(@role_ask).parent_id
      if @parent_role_id == @user_role_id
        return true
      else
        return role_true @parent_role_id, @user_role_id
      end
    end
  end

  def role_true role_id, user_role_id
    parent_role_id = Admin::Role.find(role_id).parent_id
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

  def is_admin?
    self.admin_roles.first.is_admin?
  end

  def is_manager?
    self.admin_roles.first.is_manager?
  end
end
