3.times do |ynum|
  3.times do |xnum|
    grid_hash = {}
    grid_hash["x"] = "#{xnum + 1}"
    grid_hash["y"] = "#{ynum + 1}"
    puts grid_hash
  end
end
