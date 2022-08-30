class User < ApplicationRecord
    has_many :cognito
    has_many :subscription 
    scope :by_role,      -> { order(:role) }
    scope :alphabetical,  -> { order(:last_name, :first_name) }
    scope :employees,    -> { where.not(role: 'customer') }
    
    # validates_presence_of :first_name, :last_name
    # #validates phone
    validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
    # #validates email
    # validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
    # validates :role, inclusion: { in: %w[admin provider customer], message: "is not a recognized role in system" }

    ROLES = [['Administrator', :admin],['Provider', :provider],['Customer',:customer]]

    def name 
        "#{last_name}, #{first_name}"
    end
    
    def proper_name
        "#{first_name} #{last_name}"
    end

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
