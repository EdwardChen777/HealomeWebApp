class User < ApplicationRecord
    has_secure_password

    scope :alphabetical, -> { order(:username) }

    #validates email 
    validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"

    #validates password 
    '''
    validates :username, presence: true, uniqueness: { case_sensitive: false}
    validates_presence_of :password, on: :create 
    validates_presence_of :password_confirmation, on: :create 
    validates_confirmation_of :password, on: :create, message: "does not match"
    validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
    '''
    #validates_format_of :email, with PASSWORD_FORMAT
end
