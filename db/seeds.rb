# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
name_ary = ["이불 및 담요", "사료 및 간식", "기타용품"]
name_ary.each_with_index do |name, index|
  good = Good.find_or_create_by(name: name)
  good.update(description: name_ary[index])
end

sidos = Sido.get_sidos
sidos.each do |sido|
  sigungus = Sigungu.get_sigungus(sido)
  sigungus.each do |sigungu|
    centers = Center.get_centers(sido, sigungu)
    centers.each do |center|
      Cat.get_cats(center)
    end
  end
end
