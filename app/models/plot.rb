class Plot < ApplicationRecord
  belongs_to :garden
  belongs_to :crop
  has_many :tiles
end
