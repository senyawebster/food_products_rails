class Product < ApplicationRecord

  has_many :reviews

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country_of_origin, :presence => true

  scope :recent, -> { order(created_at: :desc).limit(3) }

  scope :mostreviewed, -> { select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
  .joins(:reviews)
  .group("products.id")
  .order("reviews_count DESC")
  .limit(1) }

  scope :domestic, -> { where(country_of_origin: "USA") }

end
