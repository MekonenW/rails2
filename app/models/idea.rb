class Idea < ApplicationRecord
  belongs_to :user
  has_many 	 :likes, dependent: :destroy
  validates  :idea, presence: true
end
