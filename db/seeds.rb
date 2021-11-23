# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts "Deleting crops..."
Crop.delete_all
puts "Deleted crops."

puts "Adding crops..."
serialized_crops = File.read("db/crops.json")
crops_list = JSON.parse(serialized_crops)
crops_list["crops"].each do |crop|
  Crop.create!(crop)
end
puts "Added #{Crop.count} crops."
