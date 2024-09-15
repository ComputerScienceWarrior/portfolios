class User < ApplicationRecord
  has_many :portfolios
  has_many :projects, through: :portfolios

  has_secure_password
end
