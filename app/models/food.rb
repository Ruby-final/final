class Food < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :description, presence: true
  validates :ingredient, presence: true
  validates :step, presence: true
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
end
