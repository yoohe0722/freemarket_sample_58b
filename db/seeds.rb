require "csv"

# brand
CSV.foreach('db/brands.csv') do |row|
  Brand.create(name: row[0], brand_group_id: row[1])
end

# brand_group
CSV.foreach('db/brand_group.csv') do |row|
  BrandGroup.create(name: row[0])
end

# size
CSV.foreach('db/size.csv') do |row|
  Size.create(name: row[0])
end

# # user
# user = User.new(
#   email: 'komi@canon',
#   encrypted_password: '12345678',
#   password: '12345678',
#   nick_name: 'komican',
#   family_name: 'test',
#   family_kana: 'てすと',
#   first_name: 'taro',
#   first_kana: 'たろう',
#   birth_year: '2000',
#   birth_month: '1',
#   birth_day: '1',
#   phone_number: '01234567890',
#   zip: '1234567',
#   prefecture_id: '27',
#   city: '大阪市中央区',
#   block: '○○町',
#   building: '1-2-3',
#   user_id: '1',
# )
# user.save!

# user = User.new(
#   email: 'hanma@baki',
#   encrypted_password: '12345678',
#   password: '12345678',
#   nick_name: 'baki',
#   family_name: '範馬',
#   family_kana: 'hanma',
#   first_name: '刃牙',
#   first_kana: 'baki',
#   birth_year: '2000',
#   birth_month: '1',
#   birth_day: '1',
#   phone_number: '01234567890',
#   zip: '1234567',
#   prefecture_id: '27',
#   city: '大阪市中央区',
#   block: '○○町',
#   building: '1-2-3',
#   user_id: '1',
#   image: 'https://dip6t338iqjb9.cloudfront.net/upload/save_image/552/M2352461432.jpg',
# )
# user.save!

# user = User.new(
#   email: 'test@test',
#   encrypted_password: '12345678',
#   password: '12345678',
#   nick_name: 'テストマン',
#   family_name: 'テスト',
#   family_kana: 'てすと',
#   first_name: '太郎',
#   first_kana: 'たろう',
#   birth_year: '2000',
#   birth_month: '1',
#   birth_day: '1',
#   phone_number: '01234567890',
#   zip: '1234567',
#   prefecture_id: '27',
#   city: '大阪市中央区',
#   block: '○○町',
#   building: '1-2-3',
#   user_id: '1',
#   image: 'https://pbs.twimg.com/profile_images/1020266867171061760/EQ5kAg1c.jpg',
# )
# user.save!
