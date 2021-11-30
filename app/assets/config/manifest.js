// app/assets/config/manifest.json.erb
{
  "background_color": "white",
    "description": "Nouyuu is the best friend of people interested in gardening. From general crops information to very selected list of crops for your location and season, all can be found with Nouyuu.",
      "display": "fullscreen",
        "name": "Nouyuu",
          "icons": [
    <% files = Dir.entries(Rails.root.join("app/assets/images/icons/")).select {| f | !File.directory ? f} %>
    <% files.each_with_index do | file, index | %>
      <% match = file.match(/.+-(?<size>\d{2,3}x\d{2,3}).png/) %>
  {
    "src": "<%= image_path "icons/#{ file } " %>",
      "sizes": "<%= match && match[:size] %>",
        "type": "image/png"
      }<%= "," unless(files.size - 1) == index %>
    <% end %>
  ]
}
