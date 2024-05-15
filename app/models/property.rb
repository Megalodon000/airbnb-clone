class Property < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :headline, presence: true
    validates :adress_1, presence: true
    validates :city, presence: true
    validates :country, presence: true

    monetize :price_cents, allow_nil: true
end
