class User < ApplicationRecord
  # Tell devise to use :login in the authentication_keys
  attr_writer :login

  validates :phone, presence: true
  validates_format_of :phone, with: /^\d{10}$/, multiline: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  has_many :stores
  has_many :transactions

  def login
    @login || self.phone || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["phone = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:phone) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
