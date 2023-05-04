# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

["users", "artworks", "artwork_shares"].each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
end


user1 = User.create!(username: 'Leonardo Davinci')
user2 = User.create!(username: "Sandro Botticelli")
user3 = User.create!(username: "Frida Kahlo")

artwork1 = Artwork.create!(title: 'Mona Lisa', image_url: 'https://tinyurl.com/3taxez2m', artist_id: user1.id )
artwork2 = Artwork.create!(title: 'Birth of Venus', image_url: 'https://tinyurl.com/4xtbahzj', artist_id: user2.id)
artwork3 = Artwork.create!(title: 'Self Portrait', image_url: 'https://tinyurl.com/y453sjcm', artist_id: user3.id)

share1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
share2 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
share3 = ArtworkShare.create!(artwork_id: 2, viewer_id: 1)
share4 = ArtworkShare.create!(artwork_id: 3, viewer_id: 2)

comment1 = Comment.create!(author_id: 1, artwork_id: 2, body: "wow, very art. such wow.")
comment2 = Comment.create!(author_id: 3, artwork_id: 1, body: "nice smile, but no unibrow.")
comment3 = Comment.create!(author_id: 2, artwork_id: 3, body: "cute monkey.")


puts 'seeds have been updated'
