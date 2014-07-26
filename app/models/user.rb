class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :articles

  class << self
    def build_with_user(params = {})
      user = self.new
      user.email = params[:email]
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
    end

  end

end
