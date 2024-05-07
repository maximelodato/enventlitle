# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Supprimer toutes les données existantes
# Supprimer toutes les données existantes
# db/seeds.rb

# Supprimer toutes les données existantes
User.destroy_all
Event.destroy_all

# Créer des utilisateurs fictifs
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Récupérer tous les utilisateurs créés
users = User.all

# Créer des événements associés à des utilisateurs aléatoires
20.times do
  Event.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 4),
    start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30.days),
    duration: rand(1..5),
    price: rand(10.0..100.0),
    user: users.sample
  )
end