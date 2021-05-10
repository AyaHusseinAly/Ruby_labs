
class User < ActiveRecord::Base
  has_many :articles
  has_secure_password



  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  def generate_jwt
    JWT.encode({ id: id,
      exp: 60.days.from_now.to_i },
      Rails.application.credentials.secret_key_base)
  end
end

