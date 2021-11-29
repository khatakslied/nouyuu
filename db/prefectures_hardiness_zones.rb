require 'json'

prefectures = { prefectures: [
  {
    name: '沖縄県',
    hardiness_zone: [10, 11]
  },
  {
    name: '鹿児島県',
    hardiness_zone: [6, 7, 8, 9, 10]
  },
  {
    name: '宮崎県',
    hardiness_zone: [6, 7, 8, 9]
  },
  {
    name: '熊本県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '長崎県',
    hardiness_zone: [8, 9]
  },
  {
    name: '佐賀県',
    hardiness_zone: [8, 9]
  },
  {
    name: '福岡県',
    hardiness_zone: [8, 9]
  },
  {
    name: '大分県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '山口県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '島根県',
    hardiness_zone: [6, 7, 8, 9]
  },
  {
    name: '広島県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '鳥取県',
    hardiness_zone: [6, 7, 8, 9]
  },
  {
    name: '岡山県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '愛媛県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '香川県',
    hardiness_zone: [8, 9]
  },
  {
    name: '高知県',
    hardiness_zone: [8, 9]
  },
  {
    name: '徳島県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '兵庫県',
    hardiness_zone: [8, 9]
  },
  {
    name: '京都府',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '滋賀県',
    hardiness_zone: [8, 9]
  },
  {
    name: '三重県',
    hardiness_zone: [8, 9]
  },
  {
    name: '奈良県',
    hardiness_zone: [8, 9]
  },
  {
    name: '大阪府',
    hardiness_zone: [8, 9]
  },
  {
    name: '和歌山県',
    hardiness_zone: [7, 8, 9, 10]
  },
  {
    name: '福井県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '石川県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '富山県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '新潟県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '岐阜県',
    hardiness_zone: [6, 7, 8, 9]
  },
  {
    name: '長野県',
    hardiness_zone: [5, 6, 7, 8]
  },
  {
    name: '愛知県',
    hardiness_zone: [8, 9]
  },
  {
    name: '静岡県',
    hardiness_zone: [8, 9]
  },
  {
    name: '山梨県',
    hardiness_zone: [7, 8]
  },
  {
    name: '群馬県',
    hardiness_zone: [7, 8, 9]
  },
  {
    name: '栃木県',
    hardiness_zone: [7, 8]
  },
  {
    name: '埼玉県',
    hardiness_zone: [8, 9]
  },
  {
    name: '茨城県',
    hardiness_zone: [8, 9]
  },
  {
    name: '神奈川県',
    hardiness_zone: [8, 9]
  },
  {
    name: '東京都',
    hardiness_zone: [8, 9]
  },
  {
    name: '千葉県',
    hardiness_zone: [8, 9]
  },
  {
    name: '福島県',
    hardiness_zone: [5, 6, 7, 8, 9]
  },
  {
    name: '山形県',
    hardiness_zone: [6, 7, 8]
  },
  {
    name: '宮城県',
    hardiness_zone: [6, 7, 8]
  },
  {
    name: '秋田県',
    hardiness_zone: [6, 7, 8]
  },
  {
    name: '岩手県',
    hardiness_zone: [5, 6, 7]
  },
  {
    name: '青森県',
    hardiness_zone: [6, 7, 8]
  },
  {
    name: '北海道',
    hardiness_zone: [4, 5, 6, 7]
  }
] }

File.open('db/prefectures_hardiness_zones.json', 'wb') do |file|
  file.write(JSON.generate(prefectures))
end
