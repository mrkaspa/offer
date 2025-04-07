class Promotion < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :promotion_type, presence: true
end
