class User < ActiveRecord::Base
  has_secure_password


  # def editor?(object)
  #   # attr_reader :action
  #   @roles = "usersw"
  #   @true = object
  #   # Rails.logger.debug @true
  #   @true == @roles
  # end

  def access?(cont, act)
    @role_new = "#{cont}#{act}"
    @role_user = self.roles

  end
  def editor?
    @roles = self.roles
    @roles.each do |r|
      @true = r.title if r.title == 'Editor'
    end
    @true == 'Editor'
  end

  def admin?
    @roles = self.roles
    @roles.each do |r|
      @true = r.title if r.title == 'admin'
    end
    @true == 'admin'
  end

  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  accepts_nested_attributes_for :user_roles

  has_many :news
end
