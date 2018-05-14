# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(email: 'bla@gmail.com', nickname: 'UOne', name: 'User One', password: "12345678")
a = 1
20.times do 
	Product.create!(title: "Product number #{a}",description: "description for priduct number #{a}",images: ['Q1kpHL42AeufRMXyeKYJ','tgLnbkdLkaWB96BPQHii'])
	a+=1
end

# curl -v -X "POST" "http://0.0.0.0:3000/authAdm/sign_in" \
#      -H "Content-Type: application/json; charset=utf-8" \
#      -d $'{
#   "email": "apella2010@gmail.com",
#   "password": "12345678"
# }'