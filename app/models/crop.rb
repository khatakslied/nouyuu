class Crop < ApplicationRecord
  acts_as_favoritable
  has_many :tiles, through: :plots
  has_many :plots
  validates :name, presence: true, uniqueness: true
  PLANT_FAMILIES = ['Amaranthaceae', 'Asparagaceae', 'Asteraceae', 'Brassicaceae', 'Convolvulaceae', 'Cucurbitaceae', 'Ericaceae','Fabaceae', 'Grossulariaceae', 'Lamiaceae', 'Liliaceae', 'Malvaceae', 'Passifloraceae','Poaceae', 'Rosaceae', 'Solanaceae', 'Umbelliferae', 'Zingiberaceae']
  validates :plant_family, presence: true, inclusion: { in: PLANT_FAMILIES }
  validates :description, presence: true, length: { maximum: 300 }
  validates :image_url, presence: true
  validates :spacing_in_cm, presence: true, numericality: { only_integer: true }
  validates :planting_depth_in_cm, presence: true, numericality: { only_integer: true }
  validates :climber, default: false
  SUN_EXPOSURES = ['Full Sun', 'Partial Sun', 'Full Shade']
  validates :sun_exposure, presence: true, inclusion: { in: SUN_EXPOSURES }
  NITROGEN_NEEDS = ['Heavy Feeder', 'Light Feeder', 'Soil Builder']
  validates :nitrogen_needs, presence: true, inclusion: { in: NITROGEN_NEEDS }
  validates :max_days_to_harvest, presence: true, numericality: { only_integer: true }
  validates :min_days_to_harvest, presence: true, numericality: { only_integer: true }
  validates :sowing_months, presence: true
  validates :max_hardiness_zone, presence: true, numericality: { only_integer: true }
  validates :min_hardiness_zone, presence: true, numericality: { only_integer: true }
  validates :water_needs, presence: true, numericality: { only_integer: true }
  CROP_TYPES = ['Bulb', 'Flower', 'Fruit', 'Leafy', 'Rhizome', 'Root', 'Stem', 'Tuber']
  validates :crop_type, presence: true, inclusion: { in: CROP_TYPES }
end
