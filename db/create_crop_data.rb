require 'json'

crops = { crops: [
  {
    name: 'Tomato',
    crop_type: 'Fruit Vegetable',
    plant_family: 'Solanaceae',
    description: 'The tomato is the edible berry of the plant Solanum lycopersicum. The species originated in western South America and Central America',
    max_days_to_harvest: 90,
    min_days_to_harvest: 55,
    max_hardiness_zone: 12,
    min_hardiness_zone: 5,
    sowing_months: 'March, April',
    spacing_in_cm: 50,
    planting_depth_in_cm: 1,
    climber: true,
    sun_exposure: 'Full Sun',
    water_needs: 3,
    nitrogen_needs: 'Heavy Feeder'
  },
  {
    name: 'Cauliflower',
    crop_type: 'Flower Vegetable',
    plant_family: 'Brassicaceae',
    description: 'The cauliflower is one of several vegetables in the species Brassica oleracea. Typically, only the head is eaten – the edible white flesh sometimes called the "curd". It was originally grown in Asia around the Mediterranean Sea.',
    max_days_to_harvest: 65,
    min_days_to_harvest: 50,
    max_hardiness_zone: 12,
    min_hardiness_zone: 5,
    sowing_months: 'March, April, May, June',
    spacing_in_cm: 50,
    planting_depth_in_cm: 10,
    climber: false,
    sun_exposure: 'Full Sun',
    water_needs: 4,
    nitrogen_needs: 'Heavy Feeder'
  },
  {
    name: 'Potato',
    crop_type: 'Tuber Vegetable',
    plant_family: 'Solanaceae',
    description: 'The potato is the starchy tuber of the plant Solanum tuberosum and is a root vegetable native to the Americas.',
    max_days_to_harvest: 120,
    min_days_to_harvest: 90,
    max_hardiness_zone: 10,
    min_hardiness_zone: 3,
    sowing_months: 'March, April',
    spacing_in_cm: 50,
    planting_depth_in_cm: 1,
    climber: false,
    sun_exposure: 'Full Sun',
    water_needs: 3,
    nitrogen_needs: 'Heavy Feeder'
  },
  {
    name: 'Carrot',
    crop_type: 'Root Vegetable',
    plant_family: 'Umbelliferae',
    description: 'The carrot is a root vegetable, typically orange in color, though purple, black, red, white, and yellow cultivars exist. All are domesticated forms of the wild carrot, Daucus carota, native to Europe and Southwestern Asia.',
    max_days_to_harvest: 80,
    min_days_to_harvest: 60,
    max_hardiness_zone: 10,
    min_hardiness_zone: 3,
    sowing_months: 'April, May',
    spacing_in_cm: 5,
    planting_depth_in_cm: 2,
    climber: false,
    sun_exposure: 'Full Sun',
    water_needs: 3,
    nitrogen_needs: 'Light Feeder'
  },
  {
    name: 'Bell Pepper',
    crop_type: 'Fruit Vegetable',
    plant_family: 'Solanaceae',
    description: 'The bell pepper (also known as sweet pepper, pepper, or capsicum) is the fruit of the species Capsicum annuum. They are native to Mexico, Central America, and northern South America.',
    max_days_to_harvest: 90,
    min_days_to_harvest: 60,
    max_hardiness_zone: 10,
    min_hardiness_zone: 3,
    sowing_months: 'April, May, June, July',
    spacing_in_cm: 50,
    planting_depth_in_cm: 1,
    climber: true,
    sun_exposure: 'Full Sun',
    water_needs: 3,
    nitrogen_needs: 'Light Feeder'
  }
] }

File.open('db/crops.json', 'wb') do |file|
  file.write(JSON.generate(crops))
end
