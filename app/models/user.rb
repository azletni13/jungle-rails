class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_confirmation, presence: true, length: {minimum: 2}
  validates :password_digest, presence: true
  validates_uniqueness_of :email, :case_sensitive => false

  def self.authenticate_with_credentials(email, password)
    @current_user = User.find_by(email: email)
    if @current_user && @current_user.authenticate(password)
      return @current_user
    else
      nil
    end

  end

end
