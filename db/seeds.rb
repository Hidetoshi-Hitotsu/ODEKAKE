# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |n|
  User.create do |user|
    user.id = n
    user.name = "testname#{n}"
    user.email = "test#{n}@example.com"
    user.password = "password#{n}"
  end
end

# 5.times do |n|
#   User.create!(
#     id: n
#     name: "testname#{n}"
#     email: "test#{n}@example.com"
#     password: "password#{n}"
#   )
# end

schoolgrades = Schoolgrade.create!([
  { id: 1, grade: '未就学児'},
  { id: 2, grade: '小学１・２年生'},
  { id: 3, grade: '小学３・４年生'},
  { id: 4, grade: '小学５・６年生'},
  { id: 5, grade: '中学生以上'},
])

places = Place.create!([
  { id: 1,
    address: "〒617-0824 京都府長岡京市天神２丁目１５−１３",
    description: "４月末から美しい霧島躑躅が見られる",
    latitude: 34.9228664,
    longitude: 135.686681,
    name: "長岡天満宮",
    user_id: 1,
    schoolgrade_ids: [5]
  },
  { id: 2,
    address: "〒614-8312 京都府八幡市橋本尻江 背割堤",
    description: "美しい桜の名所。",
    latitude: 34.8910328,
    longitude: 135.6910979,
    name: "背割堤",
    user_id: 1,
    schoolgrade_ids: [4,5]
  },
  { id: 3,
    address: "〒617-0853 京都府長岡京市奥海印寺西代６−２",
    description: "用事が楽しめる遊具もあり。６月には美しい蛍が見られる。",
    latitude: 34.9235787,
    longitude: 135.6707491,
    name: "西代里山公園",
    user_id: 2,
    schoolgrade_ids: [1,2,3]
  },
  { id: 4,
    address: "〒617-0811 京都府長岡京市粟生西条ノ内26-1",
    description: "紅葉が美しい。",
    latitude: 34.93871866336308,
    longitude: 135.6778907775879,
    name: "光明寺",
    user_id: 3,
    schoolgrade_ids: [4,5]
  },
  { id: 5,
    address: "〒617-0853 京都府長岡京市奥海印寺走田３",
    description: "長い階段があり、登るのが大変。しかし、頂上からの眺めはとても美しい。登り切った後に景色を見ながら一服するのはとても気持ちが良いです。",
    latitude: 34.92742494561319,
    longitude: 135.67625999450684,
    name: "走田神社",
    user_id: 4,
    schoolgrade_ids: [1,2,3]
  },
  { id: 6,
    address: "〒617-0836 京都府長岡京市勝竜寺１２−１ ",
    description: "ガラシャ祭りも行われる",
    latitude: 34.9182125,
    longitude: 135.7002789,
    name: "勝竜寺城公園",
    user_id: 0,
    schoolgrade_ids: [4,5]
  },
  { id: 7,
    address: "〒617-0843 京都府長岡京市友岡４丁目２０−１",
    description: "美味しい。いろんな種類のコッペパンあり。人気店。",
    latitude: 34.91278653730758,
    longitude: 135.68994998931885,
    name: "西山こっぺ堂　本店",
    user_id: 0,
    schoolgrade_ids: [2,3,4,5]
  },
  { id: 8,
    address: "〒618-0001 大阪府三島郡島本町山崎２丁目１",
    description: "長いローラー滑り台もあって、楽しめる",
    latitude: 34.88762067353586,
    longitude: 135.6753158569336,
    name: "水無瀬川緑地公園",
    user_id: 1,
    schoolgrade_ids: [1,2,3]
  },
])

favorites = Favorite.create!([
  { id: 1, place_id: 1, user_id: 2,},
  { id: 2, place_id: 1, user_id: 3,},
  { id: 3, place_id: 1, user_id: 4,},
  { id: 4, place_id: 2, user_id: 4,},
  { id: 5, place_id: 2, user_id: 0,},
])
