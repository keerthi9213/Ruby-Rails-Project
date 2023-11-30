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
  email:    'alice@email.com',
  password: 'password'
)

user2 = User.create!(
  email:    'bob@email.com',
  password: 'password'
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
    Material: 'Ceramic',
    Color: 'Blue',
    Style: 'Vintage',
    Roof_design: 'Classic Teapot Lid',
    Size: 'M',
    Artistic_detail: 'Hand-painted floral design',
    Price: 49.99
  },
  {
    Material: 'Stoneware',
    Color: 'Green',
    Style: 'Modern',
    Roof_design: 'Sleek Round Lid',
    Size: 'S',
    Artistic_detail: 'Abstract Geometric Patterns',
    Price: 59.99
  },
  {
    Material: 'Wood',
    Color: 'Red',
    Style: 'Rustic',
    Roof_design: 'Pitched Barn Roof',
    Size: 'L',
    Artistic_detail: 'Carved Wood Details',
    Price: 39.99
  },
  {
    Material: 'Glass',
    Color: 'Clear',
    Style: 'Contemporary',
    Roof_design: 'Smooth Dome Lid',
    Size: 'XL',
    Artistic_detail: 'Stained Glass Panels',
    Price: 69.99
  }
])


orders = Order.create!(
    items: 'Teapot Birdhouse',
    total_cost: 75.43,
    shipping_address: '2345 Park Avenue, Memphis, TN - 38123',
    payment_details: 'Visa ending with 9087',
    user: user1
)
