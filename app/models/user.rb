class User < ActiveRecord::Base
  # :lockable, :timeoutable and :omniauthable, :confirmable

  ROLES = %w(customer admin manager dealer)
  ROLES.each{|m| define_method("#{m}!") {self.role = role.split(' ').push(m).join(' ');init_profile_methods} }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_empty_profile
  after_initialize :init_profile_methods
  after_initialize :init_home_path
  
  def initialize(attributes = {}, options = {})
    super(attributes, options) 
  end

  def is?(search_role)
    return false if role.blank?
    roles_arr = role.split(' ').map { |role| role.to_sym }
    roles_arr.include?(search_role)
  end

private
  def init_profile_methods(attributes = {}, options = {})
    self.role.split(' ').each{|r|
      self.class.send(:define_method, "#{r}_profile", -> {
        unless instance_variable_get("@#{r}_profile")
          obj = Object.const_get("#{r.capitalize}Profile").find_by_user_id(self.id)
          instance_variable_set("@#{r}_profile", obj)
        end
        instance_variable_get("@#{r}_profile")
      })
    }
  end
  
  def init_home_path(attributes = {}, options = {})
    first_role = self.role.split(' ').first
    self.class.send(:define_method, "home_path", -> {
      "#{first_role}_path"
    })
  end
  
  def create_empty_profile
    role.split(' ').each{|r|
      profile_class = Object.const_get("#{r.capitalize}Profile")
      profile_class.create!(user_id: self.id)
    }
  end

end
