class Crop < ApplicationRecord
  has_many :tiles, through: :plots
  has_many :plots
end
