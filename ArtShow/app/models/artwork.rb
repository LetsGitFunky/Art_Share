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

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_artworks,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare, 
    dependent: :destroy

  


end
