require "csv"

# brand
CSV.foreach('db/brands.csv') do |row|
  Brand.create(name: row[0], brand_group_id: row[1])
end

# #brand_group
CSV.foreach('db/brand_group.csv') do |row|
  BrandGroup.create(name: row[0])
end

# #size
CSV.foreach('db/size.csv') do |row|
  Size.create(name: row[0])
end

#user
user = User.new(
  email: 'komi@canon',
  encrypted_password: '12345678',
  password: '12345678',
  nick_name: 'komican',
  family_name: 'test',
  family_kana: 'てすと',
  first_name: 'taro',
  first_kana: 'たろう',
  birth_year: '2000',
  birth_month: '1',
  birth_day: '1',
  phone_number: '01234567890',
  zip: '1234567',
  prefecture_id: '27',
  city: '大阪市中央区',
  block: '○○町',
  building: '1-2-3',
  user_id: '1',
)
user.save!

