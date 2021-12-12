class Category < ApplicationRecord
  validates :name, :type, presence: true, length: { maximum: 50 }
end
