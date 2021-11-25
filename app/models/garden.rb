class Garden < ApplicationRecord
  belongs_to :user
  has_many :tiles
  has_many :plots
  after_create :generate_tiles

  def generate_tiles
  @height = (self.height * 2).to_i
  @width = (self.width * 2).to_i
  @height.times do |ynum|
    @width.times do |xnum|
      @tile = Tile.new
      @tile[:x_position] = "#{xnum + 1}"
      @tile[:y_position] = "#{ynum + 1}"
      @tile.garden = self
      @tile.save!
      end
    end
  end
end
