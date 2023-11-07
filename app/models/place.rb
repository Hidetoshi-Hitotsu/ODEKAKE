# == Schema Information
#
# Table name: places
#
#  id             :bigint           not null, primary key
#  address        :string
#  description    :string
#  image          :string
#  latitude       :float
#  longitude      :float
#  name           :string
#  toilet         :string
#  vendingmachine :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Place < ApplicationRecord
  has_many :targets, dependent: :destroy
  has_many :schoolgrades, through: :targets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates_presence_of  :name, :address, :schoolgrades, :description, :latitude, :longitude

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "description", "name", "toilet", "updated_at", "vendingmachine", "schoolgrade_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["favorites", "schoolgrades", "targets", "user"]
  end

  def self.handover_to_js
    Place.pluck(:id, :latitude, :longitude)
  end

  def already_favorite?(user_id)
    favorites.pluck(:user_id).include?(user_id)
  end

  ransacker :favorite_count do
    query = <<-SQL
      (
        SELECT COUNT(favorites.id)
        FROM favorites
        WHERE favorites.place_id = places.id
      )
    SQL
    Arel.sql(query)
  end

end
