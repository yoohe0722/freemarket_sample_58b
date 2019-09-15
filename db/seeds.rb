require "csv"

# brand
CSV.foreach('db/brands.csv') do |row|
  Brand.create(name: row[0], brand_group_id: row[1])
end

#brand_group
# CSV.foreach('db/brand_group.csv') do |row|
#   BrandGroup.create(name: row[0])
# end

#size
# CSV.foreach('db/size.csv') do |row|
#   Size.create(name: row[0])
# end