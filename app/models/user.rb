class User < ApplicationRecord
    has_many :microposts
    self.table_name = 'users'
    has_secure_password
    # include ActiveModel::SecurePassword
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # validates_presence_of :email,format: { with: VALID_EMAIL_REGEX },uniqueness: true

    # validates_presence_of :password 
    # validates_presence_of :name
    # validates_presence_of :password_confirmation
    
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
    validates :password_confirmation, presence: true
end
