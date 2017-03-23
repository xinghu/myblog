# encoding: UTF-8

class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :email, :password, :password_confirmation, :remember_me

  def admin?
    return self.email == 'hupengxing@gmail.com'
  end

end
