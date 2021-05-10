
class User < ActiveRecord::Base
  #has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end  
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
end