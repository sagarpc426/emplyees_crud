class Employee < ActiveRecord::Base
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A([a-z0-9_\-\.]+)@([a-z0-9\-]+\.)([a-z]{2,4}|[0-9]{1,3})\z/i
  validates :email, presence: true, length: {maximum: 255}, 
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
