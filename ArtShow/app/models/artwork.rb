# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: {scope: :artist_id}

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User,
    inverse_of: :artworks

  has_many :shared_artworks,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    inverse_of: :artwork,
    dependent: :destroy

  has_many :viewers,
    through: :shared_artworks,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    inverse_of: :artwork,
    dependent: :destroy

    has_many :likes, as: :likeable,
    dependent: :destroy

  def self.artworks_for_user_id(user_id)
    artist_artwork = Artwork.select("artworks.*").joins(:artist).where(users: {id: user_id})
    viewed_artwork = Artwork.select("artworks.*").joins(:viewers).where(users: {id: user_id})
    artist_artwork + viewed_artwork
  end




end
