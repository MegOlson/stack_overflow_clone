class User < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  before_create :encrypt_password
  has_many :questions
  after_create :set_admin_status

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end


  def set_admin_status
    self.is_admin = false
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end

# pw hash
# # $2a$10$UHKIQ7ZcDZYMZ4qcFWoomeWr9BVe3ZYfWK9T7dOq71X3BdTsUiHmW
# pw salt
# # $2a$10$UHKIQ7ZcDZYMZ4qcFWoome
