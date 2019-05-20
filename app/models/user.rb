class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  has_many :review

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
