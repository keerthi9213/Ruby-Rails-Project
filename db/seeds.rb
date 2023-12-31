# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

user1 = User.create!(
  first_name: 'alice',
  last_name: 'mathew',
  email: 'alice@email.com',
  password: 'password',
  contact_number: '+19011234567',
  role: 0
)

user2 = User.create!(
  first_name: 'bob',
  last_name: 'jason',
  email: 'bob@email.com',
  password:'password',
  contact_number: '+19017654321',
  role: 0
)

admin = User.create!(
  email:    'admin@admin.com',
  password: 'password',
  role: 1
)

question1 = Question.create!(
  content: "What's the best material for a birdhouse in a rainy climate?",
  user: user1
)

question2 = Question.create!(
  content: "How can I attract bluebirds to my garden?",
  user: user2
)

# Answers

answer1 = Answer.create!(
  content: "Ceramic materials are good for rainy climates due to their durability and water resistance.",
  question: question1,
  user: user2
)

answer2 = Answer.create!(
  content: "Bluebirds prefer open spaces with low grass and perches from which they can hunt insects.",
  question: question2,
  user: user1
)

# Clear existing data to prevent duplicates when seeding
#Birdhouse.destroy_all

# Seed the Birdhouse table with sample data
birdhouses = Birdhouse.create([
  {
    material: 'Ceramic',
    color: 'Brown',
    style: 'Vintage',
    roof_design: 'Classic Teapot Lid',
    size: 'M',
    artistic_details: 'Hand-painted floral design',
    price: 49.99
  },
  {
    material: 'Stoneware',
    color: 'Silver',
    style: 'Modern',
    roof_design: 'Sleek Round Lid',
    size: 'S',
    artistic_details: 'Abstract Geometric Patterns',
    price: 59.99
  },
  {
    material: 'Wood',
    color: 'white',
    style: 'Rustic',
    roof_design: 'Pitched Barn roof',
    size: 'L',
    artistic_details: 'Carved Wood Details',
    price: 39.99
  },
  {
    material: 'Ceramic',
    color: 'White',
    style: 'Contemporary',
    roof_design: 'Smooth Dome Lid',
    size: 'XL',
    artistic_details: 'Stained Glass Panels',
    price: 69.99
  },
  {
    material: 'Stoneware',
    color: 'Brown',
    style: 'Classic',
    roof_design: 'Classic Teapot Lid',
    size: 'L',
    artistic_details: 'Hand-painted floral design',
    price: 59.99
  },
  {
    material: 'Wood',
    color: 'Silver',
    style: 'Cottage',
    roof_design: 'Classic Teapot Lid',
    size: 'S',
    artistic_details: 'Abstract Geometric Patterns',
    price: 59.99
  },
  {
    material: 'Wood',
    color: 'White',
    style: 'Victorian',
    roof_design: 'Pitched Barn roof',
    size: 'L',
    artistic_details: 'Abstract Geometric Patterns',
    price: 34.99
  },
  {
    material: 'Ceramic',
    color: 'White',
    style: 'Country',
    roof_design: 'Smooth Dome Lid',
    size: 'M',
    artistic_details: 'Stained Glass Panels',
    price: 64.99
  },
  {
    material: 'Ceramic',
    color: 'Brown',
    style: 'Colonial',
    roof_design: 'Classic Teapot Lid',
    size: 'M',
    artistic_details: 'Abstract Geometric Patterns',
    price: 44.99
  },
  {
    material: 'Stoneware',
    color: 'Silver',
    style: 'Nautical',
    roof_design: 'Sleek Round Lid',
    size: 'S',
    artistic_details: 'Carved Wood Details',
    price: 59.49
  },
  {
    material: 'Wood',
    color: ' Brown',
    style: 'Craftsman',
    roof_design: 'Smooth Dome Lid',
    size: 'XL',
    artistic_details: 'Carved Wood Details',
    price: 39.49
  },
  {
    material: 'Ceramic',
    color: 'White',
    style: 'Whimsical',
    roof_design: 'Smooth Dome Lid',
    size: 'XL',
    artistic_details: 'Stained Glass Panels',
    price: 65.49
  }
])



image_filenames = ['birdhouse1.jpg','birdhouse2.jpg','birdhouse3.jpg','birdhouse4.jpg','birdhouse5.jpg','birdhouse6.jpg','birdhouse7.jpg','birdhouse8.jpg','birdhouse9.jpg','birdhouse10.jpg','birdhouse11.jpg','birdhouse12.jpg']
 
#birdhouses.each do |birdhouse|
 # image_filename = image_filenames.sample
  #birdhouse.figure_image.attach(io: File.open(Rails.root.join("app/assets/images/#{image_filename}")), filename:image_filename)
#end

birdhouses.each_with_index do |birdhouse, index|
  image_filename = image_filenames[index % image_filenames.size]
  birdhouse.figure_image.attach(io: File.open(Rails.root.join("app/assets/images/#{image_filename}")), filename: image_filename)
end