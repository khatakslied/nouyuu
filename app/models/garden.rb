class Garden < ApplicationRecord
  belongs_to :user
  after_create :generate_tiles

  def generate_tiles
  end
end
