class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true
  belongs_to :category_group
end
