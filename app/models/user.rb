class User < ApplicationRecord
    has_many :orders
    
    attr_accessor :password

    # before_save :encrypt_password
    before_save :without_encyrpted_password

    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :email, :on => :create
    validates_presence_of :first_name, :on => :create
    validates_presence_of :last_name, :on => :create
    validates_presence_of :username, :on => :create
    validates_uniqueness_of :email
    validates_uniqueness_of :username

    def without_encyrpted_password
        self.password_hash = self.password 
        self.user_type = "Customer"
    end
    
    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
            self.user_type = "Customer"
        end
    end

    # secure authentication
    def self.authenticate(username, password)
        user = find_by_username(username)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end
    end
    
    # insecure authentication
    def self.insecure_authenticate(username, password)
        user = find_by_username(username)
        if user && user.password_hash == password
            user
        else
            nil
        end
    end
end
