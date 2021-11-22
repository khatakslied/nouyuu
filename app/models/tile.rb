class Tile < ApplicationRecord
  belongs_to :garden
  belongs_to :plot
end
