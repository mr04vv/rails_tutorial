class User < ApplicationRecord
  has_many :microposts
  validates :email, presence: true    # 「FILL_IN」をコードに置き換えてください
  validates :name, presence: true 
end
