# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
# brand
CSV.foreach('db/brands.csv') do |row|
  Brand.create(name: row[0], group_id: row[1])
end

#brand_group
CSV.foreach('db/brand_group.csv') do |row|
  Brand_group.create(name: row[0])
end

#size
CSV.foreach('db/size.csv') do |row|
  Size.create(name: row[0], gourp_id: row[1])
end

#size_group(保留)
# CSV.foreach('db/size_groups.csv') do |row|
#   Size_group.create(name: row[0])
# end

# 別の書き方
# brands_csv = CSV.readlines("db/brands.csv")
# brands_csv.shift
# brands_csv.each do |row|
#   Brand.create(name: row[1])
# end
