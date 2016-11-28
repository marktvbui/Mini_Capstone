class Order < ApplicationRecord
  has_many :products
  belongs :user
end
