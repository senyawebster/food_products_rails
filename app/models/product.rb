class Product < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  has_many :reviews

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country_of_origin, :presence => true
end
