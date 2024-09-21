class Book < ApplicationRecord

  belongs_to :user

   # titleカラムのバリデーション
  validates :title, presence: { message: "can't be blank" }

  # bodyカラムのバリデーション
  validates :body, presence: { message: "can't be blank" }, length: { maximum: 200, message: "is too long (maximum is 200 characters" }
end
