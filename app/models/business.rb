class Business < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
end
