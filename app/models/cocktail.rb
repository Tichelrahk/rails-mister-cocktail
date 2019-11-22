class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy, inverse_of: :cocktail
  has_many :ingredients, through: :doses
  # accepts_nested_attributes_for :doses
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end
