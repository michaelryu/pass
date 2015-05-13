class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :phone
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: false, email: false
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:phone]
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
