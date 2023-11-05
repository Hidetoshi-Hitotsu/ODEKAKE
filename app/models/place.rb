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
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :latest_update, -> {order(updated_at: :desc)}
  scope :favorite_count, -> {order(favorites: :desc)}


  def self.handover_to_js
    Place.pluck(:id, :latitude, :longitude)
  end

  def self.search(search, schoolgrade_id, toilet, vendingmachine)
    if toilet != "" && vendingmachine != ""
      if schoolgrade_id != "" && search != ""
        Schoolgrade.find(schoolgrade_id).places.
          where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"]).
          where(toilet: toilet, vendingmachine: vendingmachine)
      elsif schoolgrade_id != "" && search == ""
        Schoolgrade.find(schoolgrade_id).places.where(toilet: toilet, vendingmachine: vendingmachine)
      elsif schoolgrade_id == "" && search != ""
        Place.where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"]).
          where(toilet: toilet, vendingmachine: vendingmachine)
      else
        where(toilet: toilet, vendingmachine: vendingmachine)
      end
    elsif toilet == "" && vendingmachine != ""
      if schoolgrade_id != "" && search != ""
        Schoolgrade.find(schoolgrade_id).places.
          where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"]).
          where(vendingmachine: vendingmachine)
      elsif schoolgrade_id != "" && search == ""
        Schoolgrade.find(schoolgrade_id).places.where(vendingmachine: vendingmachine)
      elsif schoolgrade_id == "" && search != ""
        Place.where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"]).
          where(vendingmachine: vendingmachine)
      else
        where(vendingmachine: vendingmachine)
      end
    elsif toilet != "" && vendingmachine == ""
      if schoolgrade_id != "" && search != ""
        Schoolgrade.find(schoolgrade_id).places.
          where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"]).
          where(toilet: toilet)
      elsif schoolgrade_id != "" && search == ""
        Schoolgrade.find(schoolgrade_id).places.where(toilet: toilet)
      elsif schoolgrade_id == "" && search != ""
        Place.where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"]).
          where(toilet: toilet)
      else
        where(toilet: toilet)
      end
    else
      if schoolgrade_id != "" && search != ""
        Schoolgrade.find(schoolgrade_id).places.
          where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"])
      elsif schoolgrade_id != "" && search == ""
        Schoolgrade.find(schoolgrade_id).places
      elsif schoolgrade_id == "" && search != ""
        Place.where(['name LIKE (?) OR address LIKE (?) OR description LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"])
      else
        Place.all
      end
    end
  end

  def already_favorite?(user_id)
    favorites.pluck(:user_id).include?(user_id)
  end
end
