# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
serialized_crops = File.read("db/crops.json")
crops_list = JSON.parse(serialized_crops)
crops_list["crops"].each do |crop|
  Crop.create!(crop)
end
