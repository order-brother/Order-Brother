class User < ApplicationRecord
  # Tell devise to use :login in the authentication_keys
  attr_writer :login

  validates :phone, presence: { message: '電話為必填。'},
                    uniqueness: { message: '很抱歉，此電話已被註冊過了。'}
  # validates_presence_of :phone
  validates_format_of :phone, with: /^\d{10}$/, multiline: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  has_many :stores, dependent: :destroy
  has_many :transactions, dependent: :destroy

  acts_as_paranoid

  def login
    @login || self.phone
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["phone = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:phone) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  # Allow user sign up without email
  def email_required?
    false
  end
end
