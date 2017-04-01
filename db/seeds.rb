# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Collectioner.destroy_all
Category.destroy_all

# USER
password = '12345678'
p user     = User.create(email: 'me@me.com', password: password)
p User.create(email: 'yo@me.com', password: password)
p User.create(email: 'to@me.com', password: password)

# CATEGORIES
['fashion', 'clothing', 'shoes', 'art', 'decoration'].each do |category|
  p Category.create(lv1_name: ['men', 'women', 'furniture'].sample, lv2_name: category)
end

# COLLECTIONER
5.times do
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  email       = Faker::Internet.email
  p Collectioner.create(
      first_name: first_name,
      last_name: last_name,
      email: email
    )
end

# COLLECTION
10.times do
  color_light  = Faker::Color.hex_color
  color_dark   = Faker::Color.hex_color
  description  = Faker::Hipster.sentences(20).join(' ')
  is_live      = [true, false, true].sample
  aname        = Faker::Name.title
  collectioner = Collectioner.all.sample
  p Collection.create(
      collectioner: collectioner,
      color_light: color_light,
      is_live: is_live,
      description: description,
      color_dark: color_dark,
      name: aname
    )
end

# PRODUCT
150.times do
  aname       = Faker::Commerce.product_name
  collection  = Collection.all.sample
  price       = Faker::Commerce.price.to_f
  is_live     = [true, false].sample
  description = Faker::Hipster.sentences(4).join(' ')
  shop_url    = Faker::Internet.url('mock.com')
  product = Product.create(
      name: aname,
      price: price,
      is_live: is_live,
      description: description,
      collection: collection,
      shop_url: shop_url
  )
  # should randomize sample(2) categories to check whether works for all configurations (including 0?)
  product.categories << Category.all.sample((1..3).to_a.sample)

  # sampled liked products
  if is_live && [true, true, false].sample
     product.liked_by user
  end

  p product

end


# PICTURE
pic = "#{Rails.root}/app/assets/images/#{row['picture']}.jpg"
cloud_pic = Cloudinary::Uploader.upload(File.open(pic))
picture_url = cloud_pic["secure_url"]

p user.find_liked_items

# INTERVIEW
Collection.all.each do |collection|
  placement = 0
  (1..3).to_a.sample.times do
    question  = "#{Faker::Hipster.words(6).join(' ')}?"
    answer    = Faker::Hipster.sentences(8).join(' ')
    placement += 1
    interview = Interview.create(
      collection: collection,
      question: question,
      answer: answer,
      placement: placement
    )
    p interview
  end
end


# Newsletter.create(email:"adrien.devilloutreys@fifty-five.com")
