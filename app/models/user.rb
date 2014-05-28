class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }
  validates :email, presence: true, :uniqueness => {case_sensitive: false}
  has_many :collections
  has_many :wines, through: :collections
end