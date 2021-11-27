serialized_prefectures = File.read("db/prefectures_hardiness_zones.json")
prefectures_list = JSON.parse(serialized_prefectures)
prefectures_list["prefectures"].each_with_index do |prefecture, index|
  puts "#{index + 1} Prefecture: #{prefecture["name"]}, Hardiness zone: #{prefecture["hardiness_zone"]}"
end
