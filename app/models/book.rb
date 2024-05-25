class Book < ApplicationRecord
  belongs_to :user
#   バリデーション
  validates :title, presence: true
  validates :body, presence: true, uniqueness: true, length: { maximum: 200 }
end
