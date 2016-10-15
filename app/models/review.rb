class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true, allow_blank: false
  validates :rating, presence: true, numericality: { inclusion: 0..10 }

end
