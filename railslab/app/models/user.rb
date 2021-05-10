
class User < ActiveRecord::Base
  has_many :articles
  has_secure_password



  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  def self.authenticate(username, password)
    user = User.find_for_authentication(:username => username)
    user&.valid_password?(password) ? user : nil
  end
end

