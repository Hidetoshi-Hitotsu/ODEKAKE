# == Schema Information
#
# Table name: places
#
#  id          :bigint           not null, primary key
#  address     :string
#  description :string
#  image       :string
#  latitude    :float
#  longitude   :float
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Place < ApplicationRecord
  has_many :targets, dependent: :destroy
  has_many :schoolgrades, through: :targets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates_presence_of :latitude, :longitude, :address, :name, :description, :schoolgrades

  def self.handover_to_js
    Place.pluck(:id, :latitude, :longitude)
  end

  def self.search(search, schoolgrade_id)
    if schoolgrade_id != "" && search != ""
      Schoolgrade.find(schoolgrade_id).places.where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    elsif schoolgrade_id != "" && search == ""
      Schoolgrade.find(schoolgrade_id).places
    elsif schoolgrade_id == "" && search != ""
      Place.where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Place.all
    end
  end

  def already_favorite?(user_id)
    favorites.pluck(:user_id).include?(user_id)
  end
end
